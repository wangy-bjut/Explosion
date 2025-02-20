// Generated by gencpp from file robot_msgs/recognition_result.msg
// DO NOT EDIT!


#ifndef ROBOT_MSGS_MESSAGE_RECOGNITION_RESULT_H
#define ROBOT_MSGS_MESSAGE_RECOGNITION_RESULT_H


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
struct recognition_result_
{
  typedef recognition_result_<ContainerAllocator> Type;

  recognition_result_()
    : result(0.0)
    , picture_path()  {
    }
  recognition_result_(const ContainerAllocator& _alloc)
    : result(0.0)
    , picture_path(_alloc)  {
  (void)_alloc;
    }



   typedef double _result_type;
  _result_type result;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _picture_path_type;
  _picture_path_type picture_path;





  typedef boost::shared_ptr< ::robot_msgs::recognition_result_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robot_msgs::recognition_result_<ContainerAllocator> const> ConstPtr;

}; // struct recognition_result_

typedef ::robot_msgs::recognition_result_<std::allocator<void> > recognition_result;

typedef boost::shared_ptr< ::robot_msgs::recognition_result > recognition_resultPtr;
typedef boost::shared_ptr< ::robot_msgs::recognition_result const> recognition_resultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robot_msgs::recognition_result_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robot_msgs::recognition_result_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robot_msgs::recognition_result_<ContainerAllocator1> & lhs, const ::robot_msgs::recognition_result_<ContainerAllocator2> & rhs)
{
  return lhs.result == rhs.result &&
    lhs.picture_path == rhs.picture_path;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robot_msgs::recognition_result_<ContainerAllocator1> & lhs, const ::robot_msgs::recognition_result_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robot_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::robot_msgs::recognition_result_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robot_msgs::recognition_result_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_msgs::recognition_result_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_msgs::recognition_result_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_msgs::recognition_result_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_msgs::recognition_result_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robot_msgs::recognition_result_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d1ac07c1008c1e8b1c60798b28200991";
  }

  static const char* value(const ::robot_msgs::recognition_result_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd1ac07c1008c1e8bULL;
  static const uint64_t static_value2 = 0x1c60798b28200991ULL;
};

template<class ContainerAllocator>
struct DataType< ::robot_msgs::recognition_result_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robot_msgs/recognition_result";
  }

  static const char* value(const ::robot_msgs::recognition_result_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robot_msgs::recognition_result_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 result\n"
"string picture_path\n"
;
  }

  static const char* value(const ::robot_msgs::recognition_result_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robot_msgs::recognition_result_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
      stream.next(m.picture_path);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct recognition_result_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robot_msgs::recognition_result_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robot_msgs::recognition_result_<ContainerAllocator>& v)
  {
    s << indent << "result: ";
    Printer<double>::stream(s, indent + "  ", v.result);
    s << indent << "picture_path: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.picture_path);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOT_MSGS_MESSAGE_RECOGNITION_RESULT_H
