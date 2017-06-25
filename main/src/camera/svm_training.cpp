#include <cstdio>

#include <fstream>
#include <string>
#include <vector>
#include <tuple>

#include <opencv2/core.hpp>
#include <opencv2/features2d.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/objdetect.hpp>
#include <opencv2/ml.hpp>

#include "common/config.h"
#include "common/logging.h"
#include "common/timing.h"
#include "common/signals.h"

#include "svm_training.h"


using namespace cv;
using namespace ae::tracking::svm;
using std::cout;
using std::cerr;
using std::endl;



// parametre hog deskriptora
const Size kWindowSize(40, 40);
const Size kBlockSize(8, 8);
const Size kBlockStride(4, 4);
const Size kCellSize(2, 2);
const int kBins = 9;

HOGDescriptor hog(kWindowSize, kBlockSize, kBlockStride, kCellSize, kBins);



int main(int argc, char *argv[])
{
  if (argc == 1)
  {
    cerr << "No arguments." << endl;
    usage(argv[0]);
    return 1;
  }

  // HOG descriptor extraction
  const std::string cmd = argv[1];
  if (cmd == "extract" || cmd == "e")
  {
    std::string file_list, descriptor_file;
    try
    {
      file_list = argv[2];
      descriptor_file = argv[3];
    }
    catch (const std::exception &e)
    {
      cerr << "Invalid extraction arguments";
      usage(argv[0]);
      return 1;
    }

    cout << "Extracting HOG descriptors from files listed in " << file_list << endl;
    cout << "Descriptors will be saved in: " << descriptor_file << endl;

    extract(file_list, descriptor_file);
    return 0;
  }

  // SVM training
  if (cmd == "train" || cmd == "t")
  {
    std::string pos, neg, out;
    try
    {
      pos = argv[2];
      neg = argv[3];
      out = argv[4];
    }
    catch (const ::std::exception &e)
    {
      cerr << "Invalid training arguments.";
      usage(argv[0]);
      return 1;
    }

    training(pos, neg, out);
    return 0;
  }

  // SVM classification test
  if (cmd == "classify" || cmd == "c")
  {
    std::string svm, samples;
    try
    {
      svm = argv[2];
      samples = argv[3];
    }
    catch (const std::exception &e)
    {
      cerr << "Invalid classification arguments." << endl;
      usage(argv[0]);
      return 1;
    }

    classTest(svm, samples);
    return 0;
  }

  cerr << "Invalid command: " << cmd << endl;
  usage(argv[0]);
  return 0;
}


void ae::tracking::svm::usage(char *name)
{
  cerr << "usage:" << endl;
  cerr << name << " extract|e FILE_LIST_FILE DESCRIPTOR_FILE" << endl;
  cerr << name << " train|t POS_DESCRIPTOR_FILE NEG_DESCRIPTOR_FILE SVM_FILE" << endl;
  cerr << name << " classify|c SVM_FILE FILE_LIST_FILE" << endl;
}


std::vector<std::string> ae::tracking::svm::readFilenames(const std::string &filename)
{
  FILE * f = fopen(filename.c_str(), "r");
  if (f == nullptr)
  {
    cerr << "Failed to open file: " << filename << endl;
    return std::vector<std::string>();
  }

  std::vector<std::string> out;
  char buf[2048];

  while (fgets(buf, 2048, f) != nullptr)
  {
    std::string s(buf);
    s.erase(s.end() - 1);
    out.push_back(s);
  }

  return out;
}


test_vector ae::tracking::svm::readTestFilenames(const std::string &filename)
{
  FILE * f = fopen(filename.c_str(), "r");
  if (f == nullptr)
  {
    cerr << "Failed to open file: " << filename << endl;
    return test_vector();
  }

  test_vector out;
  char buf[2048];

  while (fgets(buf, 2048, f) != nullptr)
  {
    std::string s(buf);
    s.erase(s.end() - 1);

    int sample_class = stoi(s.substr(0, 1));
    std::string sample_file = s.substr(2, s.size() - 2);

    out.emplace_back(sample_class, sample_file);
  }

  return out;
}


Mat ae::tracking::svm::loadSample(const std::string &filename)
{
  Mat img = imread(filename, IMREAD_GRAYSCALE);
  if (img.empty())
  {
    return img;
  }

  if (img.rows != hog.winSize.height || img.cols != hog.winSize.width)
  {
    if (img.cols < hog.winSize.width || img.rows < hog.winSize.height)
    {
      cerr << "Image is too small for HOG: " << filename << endl;
      return Mat();
    }

    int x = (img.cols - hog.winSize.width) / 2;
    int y = (img.rows - hog.winSize.height) / 2;

    Rect crop(Point(x, y), hog.winSize);

    img = img(crop);
  }

  return img;
}


void ae::tracking::svm::extract(const std::string &file_list, const std::string &descriptor_file)
{
  std::vector<std::string> files = readFilenames(file_list);
  Mat img;
  std::vector<std::vector<float>> img_descriptors;

  for (const auto &image_file : files)
  {
    img = loadSample(image_file);
    if (img.empty())
    {
      cerr << "Unable to open file: " << image_file << endl;
      continue;
    }

    std::vector<float> descriptors;
    hog.compute(img, descriptors);

    img_descriptors.emplace_back();
    std::swap(descriptors, img_descriptors.back());
  }

  FileStorage d(descriptor_file, FileStorage::WRITE);
  const int row = img_descriptors.size();
  const int col = img_descriptors[0].size();

  Mat m(row,col,CV_32F);
  for(int i = 0; i < row; ++i)
  {
    memcpy( &(m.data[col * i * sizeof(float) ]), img_descriptors[i].data(), col * sizeof(float));
  }
  write(d, "descriptors",  m);
  d.release();

  cout << "Extracted HOG desciptors from " << row << " images." << endl;
  cout << "HOG desciptor size is " << col << " floats." << endl;
}


void ae::tracking::svm::training(const std::string &pos_file, const std::string &neg_file, const std::string &svm_file)
{
  Mat training_descriptors;
  Mat training_labels;

  {
    cout << "Loading descriptor files." << endl;

    FileStorage pos(pos_file, FileStorage::READ);
    FileStorage neg(neg_file, FileStorage::READ);
    Mat d, l;

    pos["descriptors"] >> d;
    training_descriptors.push_back(d);
    l = Mat(d.rows, 1, CV_32S, Scalar(1));
    training_labels.push_back(l);
    d = Mat();

    neg["descriptors"] >> d;
    training_descriptors.push_back(d);
    l = Mat(d.rows, 1, CV_32S, Scalar(0));
    training_labels.push_back(l);

    pos.release();
    neg.release();
  }

  cout << "Training SVM with " << training_descriptors.size() << " samples." << endl;

  Ptr<ml::SVM> svm = ml::SVM::create();
  svm->setType(ml::SVM::C_SVC);
  svm->setKernel(ml::SVM::LINEAR);

  Ptr<ml::TrainData> train_data = ml::TrainData::create(training_descriptors, ml::SampleTypes::ROW_SAMPLE, training_labels);

  svm->trainAuto(train_data);
  svm->save(svm_file);

  cout << "Saved trained SVM to file: " << svm_file << endl;
}


void ae::tracking::svm::classTest(const std::string &svm_file, const std::string &sample_file)
{
  Ptr<ml::SVM> svm = ml::SVM::load(svm_file);
  test_vector test_cases = readTestFilenames(sample_file);
  Mat result = Mat(2, 2, CV_32S, Scalar(0));
  Mat img;


  for (const auto &sample : test_cases)
  {
    const int s_class = std::get<0>(sample);
    const std::string &s_image = std::get<1>(sample);

    img = loadSample(s_image);
    if (img.empty())
    {
      cerr << "Failed to read image: " << s_image << endl;
      continue;
    }

    std::vector<float> descriptors;
    hog.compute(img, descriptors);

    Mat prediction_mat;
    svm->predict(descriptors, prediction_mat);
    int prediction = prediction_mat.at<float>(0);

    ++result.at<int>(s_class, prediction);

    if (s_class == 1 && prediction == 0)
    {
      cout << "False negative: " << s_image << endl;
    }
    if (s_class == 0 && prediction == 1)
    {
      cout << "False positive: " << s_image << endl;
    }
  }

  cout << "Classification test result:" << endl << result << endl;
}


Mat ae::tracking::svm::get_hogdescriptor_visu(const Mat& color_origImg, std::vector<float>& descriptorValues, const Size & size )
{
    const int DIMX = size.width;
    const int DIMY = size.height;
    float zoomFac = 8;
    Mat visu;
    resize(color_origImg, visu, Size( (int)(color_origImg.cols*zoomFac), (int)(color_origImg.rows*zoomFac) ) );

    int cellSize        = 5;
    int gradientBinSize = 9;
    float radRangeForOneBin = (float)(CV_PI/(float)gradientBinSize); // dividing 180 into 9 bins, how large (in rad) is one bin?

    // prepare data structure: 9 orientation / gradient strenghts for each cell
    int cells_in_x_dir = DIMX / cellSize;
    int cells_in_y_dir = DIMY / cellSize;
    float*** gradientStrengths = new float**[cells_in_y_dir];
    int** cellUpdateCounter   = new int*[cells_in_y_dir];
    for (int y=0; y<cells_in_y_dir; y++)
    {
        gradientStrengths[y] = new float*[cells_in_x_dir];
        cellUpdateCounter[y] = new int[cells_in_x_dir];
        for (int x=0; x<cells_in_x_dir; x++)
        {
            gradientStrengths[y][x] = new float[gradientBinSize];
            cellUpdateCounter[y][x] = 0;

            for (int bin=0; bin<gradientBinSize; bin++)
                gradientStrengths[y][x][bin] = 0.0;
        }
    }

    // nr of blocks = nr of cells - 1
    // since there is a new block on each cell (overlapping blocks!) but the last one
    int blocks_in_x_dir = cells_in_x_dir - 1;
    int blocks_in_y_dir = cells_in_y_dir - 1;

    // compute gradient strengths per cell
    int descriptorDataIdx = 0;
    int cellx = 0;
    int celly = 0;

    for (int blockx=0; blockx<blocks_in_x_dir; blockx++)
    {
        for (int blocky=0; blocky<blocks_in_y_dir; blocky++)
        {
            // 4 cells per block ...
            for (int cellNr=0; cellNr<4; cellNr++)
            {
                // compute corresponding cell nr
                cellx = blockx;
                celly = blocky;
                if (cellNr==1) celly++;
                if (cellNr==2) cellx++;
                if (cellNr==3)
                {
                    cellx++;
                    celly++;
                }

                for (int bin=0; bin<gradientBinSize; bin++)
                {
                    float gradientStrength = descriptorValues[ descriptorDataIdx ];
                    descriptorDataIdx++;

                    gradientStrengths[celly][cellx][bin] += gradientStrength;

                } // for (all bins)


                // note: overlapping blocks lead to multiple updates of this sum!
                // we therefore keep track how often a cell was updated,
                // to compute average gradient strengths
                cellUpdateCounter[celly][cellx]++;

            } // for (all cells)


        } // for (all block x pos)
    } // for (all block y pos)


    // compute average gradient strengths
    for (celly=0; celly<cells_in_y_dir; celly++)
    {
        for (cellx=0; cellx<cells_in_x_dir; cellx++)
        {

            float NrUpdatesForThisCell = (float)cellUpdateCounter[celly][cellx];

            // compute average gradient strenghts for each gradient bin direction
            for (int bin=0; bin<gradientBinSize; bin++)
            {
                gradientStrengths[celly][cellx][bin] /= NrUpdatesForThisCell;
            }
        }
    }

    // draw cells
    for (celly=0; celly<cells_in_y_dir; celly++)
    {
        for (cellx=0; cellx<cells_in_x_dir; cellx++)
        {
            int drawX = cellx * cellSize;
            int drawY = celly * cellSize;

            int mx = drawX + cellSize/2;
            int my = drawY + cellSize/2;

            rectangle(visu, Point((int)(drawX*zoomFac), (int)(drawY*zoomFac)), Point((int)((drawX+cellSize)*zoomFac), (int)((drawY+cellSize)*zoomFac)), Scalar(100,100,100), 1);

            // draw in each cell all 9 gradient strengths
            for (int bin=0; bin<gradientBinSize; bin++)
            {
                float currentGradStrength = gradientStrengths[celly][cellx][bin];

                // no line to draw?
                if (currentGradStrength==0)
                    continue;

                float currRad = bin * radRangeForOneBin + radRangeForOneBin/2;

                float dirVecX = cos( currRad );
                float dirVecY = sin( currRad );
                float maxVecLen = (float)(cellSize/2.f);
                float scale = 2.5; // just a visualization scale, to see the lines better

                // compute line coordinates
                float x1 = mx - dirVecX * currentGradStrength * maxVecLen * scale;
                float y1 = my - dirVecY * currentGradStrength * maxVecLen * scale;
                float x2 = mx + dirVecX * currentGradStrength * maxVecLen * scale;
                float y2 = my + dirVecY * currentGradStrength * maxVecLen * scale;

                // draw gradient visualization
                line(visu, Point((int)(x1*zoomFac),(int)(y1*zoomFac)), Point((int)(x2*zoomFac),(int)(y2*zoomFac)), Scalar(0,255,0), 1);

            } // for (all bins)

        } // for (cellx)
    } // for (celly)


    // don't forget to free memory allocated by helper data structures!
    for (int y=0; y<cells_in_y_dir; y++)
    {
        for (int x=0; x<cells_in_x_dir; x++)
        {
            delete[] gradientStrengths[y][x];
        }
        delete[] gradientStrengths[y];
        delete[] cellUpdateCounter[y];
    }
    delete[] gradientStrengths;
    delete[] cellUpdateCounter;

    return visu;

}
