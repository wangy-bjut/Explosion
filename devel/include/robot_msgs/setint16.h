// Generated by gencpp from file robot_msgs/setint16.msg
// DO NOT EDIT!


#ifndef ROBOT_MSGS_MESSAGE_SETINT16_H
#define ROBOT_MSGS_MESSAGE_SETINT16_H

#include <ros/service_traits.h>


#include <robot_msgs/setint16Request.h>
#include <robot_msgs/setint16Response.h>


namespace robot_msgs
{

struct setint16
{

typedef setint16Request Request;
typedef setint16Response Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct setint16
} // namespace robot_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robot_msgs::setint16 > {
  static const char* value()
  {
    return "b8a3204d8bafe68f75673256846654f5";
  }

  static const char* value(const ::robot_msgs::setint16&) { return value(); }
};

template<>
struct DataType< ::robot_msgs::setint16 > {
  static const char* value()
  {
    return "robot_msgs/setint16";
  }

  static const char* value(const ::robot_msgs::setint16&) { return value(); }
};


// service_traits::MD5Sum< ::robot_msgs::setint16Request> should match
// service_traits::MD5Sum< ::robot_msgs::setint16 >
template<>
struct MD5Sum< ::robot_msgs::setint16Request>
{
  static const char* value()
  {
    return MD5Sum< ::robot_msgs::setint16 >::value();
  }
  static const char* value(const ::robot_msgs::setint16Request&)
  {
    return value();
  }
};

// service_traits::DataType< ::robot_msgs::setint16Request> should match
// service_traits::DataType< ::robot_msgs::setint16 >
template<>
struct DataType< ::robot_msgs::setint16Request>
{
  static const char* value()
  {
    return DataType< ::robot_msgs::setint16 >::value();
  }
  static const char* value(const ::robot_msgs::setint16Request&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robot_msgs::setint16Response> should match
// service_traits::MD5Sum< ::robot_msgs::setint16 >
template<>
struct MD5Sum< ::robot_msgs::setint16Response>
{
  static const char* value()
  {
    return MD5Sum< ::robot_msgs::setint16 >::value();
  }
  static const char* value(const ::robot_msgs::setint16Response&)
  {
    return value();
  }
};

// service_traits::DataType< ::robot_msgs::setint16Response> should match
// service_traits::DataType< ::robot_msgs::setint16 >
template<>
struct DataType< ::robot_msgs::setint16Response>
{
  static const char* value()
  {
    return DataType< ::robot_msgs::setint16 >::value();
  }
  static const char* value(const ::robot_msgs::setint16Response&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOT_MSGS_MESSAGE_SETINT16_H
