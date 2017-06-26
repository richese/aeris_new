#include <cstdio>

#include <vector>
#include <map>
#include <mutex>

#include "agent.h"
#include "agent_body.h"
#include "config.h"
#include "logging.h"


const ae::AgentBodyPtr ae::AgentBody::getBody(const uint16_t body_id)
{
  AgentBodyPtr body;

  auto *body_storage = helpers::BodyStorage::get();
  std::lock_guard<std::mutex> lock(body_storage->lock);

  auto body_item = body_storage->data.find(body_id);
  if (body_item != body_storage->data.end())
  {
    body = body_item->second;
  }
  else
  {
    body = AgentBodyPtr(loadBody(body_id));
    body_storage->data[body_id] = body;
  }

  return body;
}


const ae::AgentBodyPtr ae::AgentBody::getBody(const AgentInterface &agent)
{
  return getBody(agent.body);
}


uint16_t ae::AgentBody::getBodyType(const uint16_t agent_type)
{
  for (const auto &agent : config::get["agent_list"])
  {
    if (agent["interface_type"].get<uint16_t>() == agent_type)
    {
      return config::get["body_list"][agent["body"].get<std::string>()]["interface_type"];
    }
  }

  LOG(ERROR) << "Looking for body of non existing agent type: " << agent_type;
  return 0;
}


ae::AgentBody* ae::AgentBody::loadBody(const uint16_t body_id)
{
  std::string model_filename = "";
  float model_scale = 1.0;

  // checks
  if (config::get.find("body_list") == config::get.end())
  {
    LOG(ERROR) << "Config file is missing \"body_list\" section.";
    return nullptr;
  }
  auto body_list = config::get["body_list"];
  if (!body_list.is_object())
  {
    LOG(ERROR) << "body_list has to be an object not: " << body_list;
    return nullptr;
  }

  // find body with required body id
  for (const auto &body : body_list)
  {
    if (!body.is_object())
    {
      LOG(WARNING) << "Invalid entry type in body_list section: " << body;
      continue;
    }
    if (body.find("interface_type") == body.end() ||
        !body["interface_type"].is_number_unsigned() ||
        body.find("model") == body.end() ||
        !(body["model"].is_string() || body["model"].is_null()) ||
        body.find("scale") == body.end() ||
        !body["scale"].is_number())
    {
      LOG(ERROR) << "Invalid entry in body_list section: " << body;
      continue;
    }
    if (body["interface_type"].get<uint16_t>() == body_id)
    {
      if (body["model"].is_string())
      {
        model_filename = body["model"];
      }
      model_scale = body["scale"];
      break;
    }
  }

  AgentBody *body = new AgentBody();

  // do not load model if no filename is provided => agent has empty model
  if (model_filename.size() != 0)
  {
    if (body->loadObj(config::path(config::DIR_ROOT, model_filename), model_scale) != 0)
    {
      delete body;
      LOG(ERROR) << "Failed to load body from file " << model_filename;
      return nullptr;
    }
  }

  VLOG(3) << "Loaded AgentBody(id=" << body_id << ", vert="<< body->vertices().size() << ", file=\"" << model_filename << "\")";
  return body;
}


ae::AgentBody::AgentBody() :
  m_vertices()
{

}


ae::AgentBody::~AgentBody()
{

}


int ae::AgentBody::loadObj(const std::string &filename, const float scale)
{
  std::vector< unsigned int > vertexIndices, uvIndices, normalIndices;
  std::vector< struct Point3D > temp_vertices;
  std::vector< struct Point2D > temp_uvs;
  std::vector< struct Point3D > temp_normals;

  using Point = Point3D;

  FILE * file = fopen(filename.c_str(), "r");
  if( file == NULL ){
      LOG(ERROR) << "Error while opening body model: " << filename;
      return 1;
  }

  int res_dummy;

  while( 1 )
  {

      char lineHeader[128];
      // read the first word of the line
      int res = fscanf(file, "%s", lineHeader);
      if (res == EOF)
          break; // EOF = End Of File. Quit the loop.

      // else : parse lineHeader

      if ( strcmp( lineHeader, "v" ) == 0 )
      {
          Point vertex;
          res_dummy = fscanf(file, "%f %f %f\n", &vertex.x, &vertex.y, &vertex.z );

          vertex.x*= scale;
          vertex.y*= scale;
          vertex.z*= scale;
          temp_vertices.push_back(vertex);
      }
      else if ( strcmp( lineHeader, "vt" ) == 0 )
      {
            Point2D uv;
            res_dummy = fscanf(file, "%f %f\n", &uv.x, &uv.y );
            temp_uvs.push_back(uv);
      }
      else if ( strcmp( lineHeader, "vn" ) == 0 )
      {
            Point normal;
            res_dummy = fscanf(file, "%f %f %f\n", &normal.x, &normal.y, &normal.z );
            temp_normals.push_back(normal);
      }
      else if ( strcmp( lineHeader, "f" ) == 0 )
      {
              std::string vertex1, vertex2, vertex3;

              unsigned int vertexIndex[3], uvIndex[3], normalIndex[3];

              uvIndex[0] = 0;
              uvIndex[1] = 0;
              uvIndex[2] = 0;
              // int matches = fscanf(file, "%u/%u/%u %u/%u/%u %u/%u/%u\n", &vertexIndex[0], &uvIndex[0], &normalIndex[0], &vertexIndex[1], &uvIndex[1], &normalIndex[1], &vertexIndex[2], &uvIndex[2], &normalIndex[2] );

              int matches = fscanf( file, "%u//%u %u//%u %u//%u\n",

                                    &vertexIndex[0],
                                  //  &uvIndex[0],
                                    &normalIndex[0],

                                    &vertexIndex[1],
                                  //  &uvIndex[1],
                                    &normalIndex[1],

                                    &vertexIndex[2],
                                  //  &uvIndex[2],
                                    &normalIndex[2] );

              if (matches != 6)
              {
                  printf("File can't be read by our simple parser : ( Try exporting with other options\n");
                  return 1;
              }

              /*
              printf("%u//%u %u//%u %u//%u\n",
                                    vertexIndex[0],
                                  //  uvIndex[0],
                                    normalIndex[0],
                                    vertexIndex[1],
                                  //  uvIndex[1],
                                    normalIndex[1],
                                    vertexIndex[2],
                                  //  uvIndex[2],
                                    normalIndex[2] );
              */
              vertexIndices.push_back(vertexIndex[0]);
              vertexIndices.push_back(vertexIndex[1]);
              vertexIndices.push_back(vertexIndex[2]);
              uvIndices    .push_back(uvIndex[0]);
              uvIndices    .push_back(uvIndex[1]);
              uvIndices    .push_back(uvIndex[2]);
              normalIndices.push_back(normalIndex[0]);
              normalIndices.push_back(normalIndex[1]);
              normalIndices.push_back(normalIndex[2]);
      }

  }


  // For each vertex of each triangle
  for( unsigned int i=0; i<vertexIndices.size(); i++ )
  {
      unsigned int vertexIndex = vertexIndices[i];
      Point vertex = temp_vertices[ vertexIndex-1 ];
      m_vertices.push_back(vertex);
  }

  (void)res_dummy;




  return 0;
}
