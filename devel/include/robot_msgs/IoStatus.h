// Generated by gencpp from file robot_msgs/IoStatus.msg
// DO NOT EDIT!


#ifndef ROBOT_MSGS_MESSAGE_IOSTATUS_H
#define ROBOT_MSGS_MESSAGE_IOSTATUS_H


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
struct IoStatus_
{
  typedef IoStatus_<ContainerAllocator> Type;

  IoStatus_()
    : status_stop(0)
    , status_slow(0)  {
    }
  IoStatus_(const ContainerAllocator& _alloc)
    : status_stop(0)
    , status_slow(0)  {
  (void)_alloc;
    }



   typedef int8_t _status_stop_type;
  _status_stop_type status_stop;

   typedef int8_t _status_slow_type;
  _status_slow_type status_slow;





  typedef boost::shared_ptr< ::robot_msgs::IoStatus_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robot_msgs::IoStatus_<ContainerAllocator> const> ConstPtr;

}; // struct IoStatus_

typedef ::robot_msgs::IoStatus_<std::allocator<void> > IoStatus;

typedef boost::shared_ptr< ::robot_msgs::IoStatus > IoStatusPtr;
typedef boost::shared_ptr< ::robot_msgs::IoStatus const> IoStatusConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robot_msgs::IoStatus_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robot_msgs::IoStatus_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robot_msgs::IoStatus_<ContainerAllocator1> & lhs, const ::robot_msgs::IoStatus_<ContainerAllocator2> & rhs)
{
  return lhs.status_stop == rhs.status_stop &&
    lhs.status_slow == rhs.status_slow;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robot_msgs::IoStatus_<ContainerAllocator1> & lhs, const ::robot_msgs::IoStatus_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robot_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::robot_msgs::IoStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robot_msgs::IoStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_msgs::IoStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_msgs::IoStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_msgs::IoStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_msgs::IoStatus_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robot_msgs::IoStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8c8bf31ab13adffd23ec7ea73641f167";
  }

  static const char* value(const ::robot_msgs::IoStatus_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8c8bf31ab13adffdULL;
  static const uint64_t static_value2 = 0x23ec7ea73641f167ULL;
};

template<class ContainerAllocator>
struct DataType< ::robot_msgs::IoStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robot_msgs/IoStatus";
  }

  static const char* value(const ::robot_msgs::IoStatus_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robot_msgs::IoStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int8 status_stop\n"
"int8 status_slow\n"
;
  }

  static const char* value(const ::robot_msgs::IoStatus_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robot_msgs::IoStatus_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.status_stop);
      stream.next(m.status_slow);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct IoStatus_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robot_msgs::IoStatus_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robot_msgs::IoStatus_<ContainerAllocator>& v)
  {
    s << indent << "status_stop: ";
    Printer<int8_t>::stream(s, indent + "  ", v.status_stop);
    s << indent << "status_slow: ";
    Printer<int8_t>::stream(s, indent + "  ", v.status_slow);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOT_MSGS_MESSAGE_IOSTATUS_H
