// Generated by gencpp from file robot_msgs/temp_detectionResponse.msg
// DO NOT EDIT!


#ifndef ROBOT_MSGS_MESSAGE_TEMP_DETECTIONRESPONSE_H
#define ROBOT_MSGS_MESSAGE_TEMP_DETECTIONRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robot_msgs
{
template <class ContainerAllocator>
struct temp_detectionResponse_
{
  typedef temp_detectionResponse_<ContainerAllocator> Type;

  temp_detectionResponse_()
    : temp(0.0)  {
    }
  temp_detectionResponse_(const ContainerAllocator& _alloc)
    : temp(0.0)  {
  (void)_alloc;
    }



   typedef double _temp_type;
  _temp_type temp;





  typedef boost::shared_ptr< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> const> ConstPtr;

}; // struct temp_detectionResponse_

typedef ::robot_msgs::temp_detectionResponse_<std::allocator<void> > temp_detectionResponse;

typedef boost::shared_ptr< ::robot_msgs::temp_detectionResponse > temp_detectionResponsePtr;
typedef boost::shared_ptr< ::robot_msgs::temp_detectionResponse const> temp_detectionResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robot_msgs::temp_detectionResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robot_msgs::temp_detectionResponse_<ContainerAllocator1> & lhs, const ::robot_msgs::temp_detectionResponse_<ContainerAllocator2> & rhs)
{
  return lhs.temp == rhs.temp;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robot_msgs::temp_detectionResponse_<ContainerAllocator1> & lhs, const ::robot_msgs::temp_detectionResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robot_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1c666a4992d5d6108cc9173c68311b1d";
  }

  static const char* value(const ::robot_msgs::temp_detectionResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1c666a4992d5d610ULL;
  static const uint64_t static_value2 = 0x8cc9173c68311b1dULL;
};

template<class ContainerAllocator>
struct DataType< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robot_msgs/temp_detectionResponse";
  }

  static const char* value(const ::robot_msgs::temp_detectionResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 temp\n"
;
  }

  static const char* value(const ::robot_msgs::temp_detectionResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.temp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct temp_detectionResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robot_msgs::temp_detectionResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robot_msgs::temp_detectionResponse_<ContainerAllocator>& v)
  {
    s << indent << "temp: ";
    Printer<double>::stream(s, indent + "  ", v.temp);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOT_MSGS_MESSAGE_TEMP_DETECTIONRESPONSE_H
