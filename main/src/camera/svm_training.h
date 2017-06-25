#ifndef _SVM_TRAINIG_H_
#define _SVM_TRAINIG_H_

#include <string>
#include <vector>
#include <tuple>


#include <opencv2/core.hpp>


namespace ae {

namespace tracking {

/** \brief Namespace containing SVM training application functions.
 *
 * Trainend SVM is used by robot-tracking application for multiview model of
 * robot body.
 */
namespace svm {


/** \addtogroup robot-tracking
 * @{
 *
 * \addtogroup svm-training SVM Training
 * @{
 * \brief Stand alone application to train SVM classification model.
 *
 * Example usage of svm-training application is located in train_svm.sh script
 * in bin directory.
 */


typedef std::vector<std::tuple<int, std::string>> test_vector;


/** \brief Function to visualize HOG descriptors. */
cv::Mat get_hogdescriptor_visu(const cv::Mat &color_origImg,
                               std::vector<float> &descriptorValues,
                               const cv::Size &size);

/** \brief SVM training application help message.
 *
 * \param name
 * Name of application executable.
 */
void usage(char *name);

/** \brief Helper function to parse file paths from file.
 *
 * Files should contain 1 absolute path per line.
 * Line separator must be only LF.
 */
std::vector<std::string> readFilenames(const std::string &filename);

/** \brief Helper function to parse clasifier test file.
 *
 * This file contains one entry per line.
 * Line separator must be only LF.
 *
 * Entries are formated as such:
 *
 *     0 /path/to/image1.png
 *     1 /path/to/image2.png
 *
 * The number is expected SVM prediction result and file path to image that
 * will be analyzed.
 */
test_vector readTestFilenames(const std::string &filename);

/** \brief Load a grayscale image and crop it to HOG window size. */
cv::Mat loadSample(const std::string &filename);

void extract(const std::string &file_list, const std::string &descriptor_file);

void training(const std::string &pos_file, const std::string &neg_file, const std::string &svm_file);

void classTest(const std::string &svm_file, const std::string &sample_file);


/** @}
 *  @}
 */


} /* namespace svm */

} /* namespace tracking */

} /* namespace ae */


#endif /* _SVM_TRAINIG_H_ */
