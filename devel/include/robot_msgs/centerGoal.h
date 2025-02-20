// Generated by gencpp from file robot_msgs/centerGoal.msg
// DO NOT EDIT!


#ifndef ROBOT_MSGS_MESSAGE_CENTERGOAL_H
#define ROBOT_MSGS_MESSAGE_CENTERGOAL_H


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
struct centerGoal_
{
  typedef centerGoal_<ContainerAllocator> Type;

  centerGoal_()
    : state(0)
    , point_number(0)  {
    }
  centerGoal_(const ContainerAllocator& _alloc)
    : state(0)
    , point_number(0)  {
  (void)_alloc;
    }



   typedef uint8_t _state_type;
  _state_type state;

   typedef uint16_t _point_number_type;
  _point_number_type point_number;





  typedef boost::shared_ptr< ::robot_msgs::centerGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robot_msgs::centerGoal_<ContainerAllocator> const> ConstPtr;

}; // struct centerGoal_

typedef ::robot_msgs::centerGoal_<std::allocator<void> > centerGoal;

typedef boost::shared_ptr< ::robot_msgs::centerGoal > centerGoalPtr;
typedef boost::shared_ptr< ::robot_msgs::centerGoal const> centerGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robot_msgs::centerGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robot_msgs::centerGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robot_msgs::centerGoal_<ContainerAllocator1> & lhs, const ::robot_msgs::centerGoal_<ContainerAllocator2> & rhs)
{
  return lhs.state == rhs.state &&
    lhs.point_number == rhs.point_number;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robot_msgs::centerGoal_<ContainerAllocator1> & lhs, const ::robot_msgs::centerGoal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robot_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::robot_msgs::centerGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robot_msgs::centerGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_msgs::centerGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_msgs::centerGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_msgs::centerGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_msgs::centerGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robot_msgs::centerGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8049b2c79c10b7ff9a3f5b6430379d8e";
  }

  static const char* value(const ::robot_msgs::centerGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8049b2c79c10b7ffULL;
  static const uint64_t static_value2 = 0x9a3f5b6430379d8eULL;
};

template<class ContainerAllocator>
struct DataType< ::robot_msgs::centerGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robot_msgs/centerGoal";
  }

  static const char* value(const ::robot_msgs::centerGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robot_msgs::centerGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"uint8 state #开始\n"
"uint16 point_number #执行动作的点位\n"
;
  }

  static const char* value(const ::robot_msgs::centerGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robot_msgs::centerGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.state);
      stream.next(m.point_number);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct centerGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robot_msgs::centerGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robot_msgs::centerGoal_<ContainerAllocator>& v)
  {
    s << indent << "state: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.state);
    s << indent << "point_number: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.point_number);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOT_MSGS_MESSAGE_CENTERGOAL_H
