// Generated by gencpp from file alarm_device/alarm_srvRequest.msg
// DO NOT EDIT!


#ifndef ALARM_DEVICE_MESSAGE_ALARM_SRVREQUEST_H
#define ALARM_DEVICE_MESSAGE_ALARM_SRVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace alarm_device
{
template <class ContainerAllocator>
struct alarm_srvRequest_
{
  typedef alarm_srvRequest_<ContainerAllocator> Type;

  alarm_srvRequest_()
    : start_play(0)
    , volume(0)
    , loop_mode(0)
    , filename(0)
    , fileorder(0)
    , list_n()  {
    }
  alarm_srvRequest_(const ContainerAllocator& _alloc)
    : start_play(0)
    , volume(0)
    , loop_mode(0)
    , filename(0)
    , fileorder(0)
    , list_n(_alloc)  {
  (void)_alloc;
    }



   typedef int64_t _start_play_type;
  _start_play_type start_play;

   typedef int64_t _volume_type;
  _volume_type volume;

   typedef int64_t _loop_mode_type;
  _loop_mode_type loop_mode;

   typedef int64_t _filename_type;
  _filename_type filename;

   typedef int64_t _fileorder_type;
  _fileorder_type fileorder;

   typedef std::vector<int64_t, typename ContainerAllocator::template rebind<int64_t>::other >  _list_n_type;
  _list_n_type list_n;





  typedef boost::shared_ptr< ::alarm_device::alarm_srvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::alarm_device::alarm_srvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct alarm_srvRequest_

typedef ::alarm_device::alarm_srvRequest_<std::allocator<void> > alarm_srvRequest;

typedef boost::shared_ptr< ::alarm_device::alarm_srvRequest > alarm_srvRequestPtr;
typedef boost::shared_ptr< ::alarm_device::alarm_srvRequest const> alarm_srvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::alarm_device::alarm_srvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::alarm_device::alarm_srvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::alarm_device::alarm_srvRequest_<ContainerAllocator1> & lhs, const ::alarm_device::alarm_srvRequest_<ContainerAllocator2> & rhs)
{
  return lhs.start_play == rhs.start_play &&
    lhs.volume == rhs.volume &&
    lhs.loop_mode == rhs.loop_mode &&
    lhs.filename == rhs.filename &&
    lhs.fileorder == rhs.fileorder &&
    lhs.list_n == rhs.list_n;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::alarm_device::alarm_srvRequest_<ContainerAllocator1> & lhs, const ::alarm_device::alarm_srvRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace alarm_device

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::alarm_device::alarm_srvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::alarm_device::alarm_srvRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::alarm_device::alarm_srvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::alarm_device::alarm_srvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::alarm_device::alarm_srvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::alarm_device::alarm_srvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::alarm_device::alarm_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "eba3e264b7446975115540c352322db3";
  }

  static const char* value(const ::alarm_device::alarm_srvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xeba3e264b7446975ULL;
  static const uint64_t static_value2 = 0x115540c352322db3ULL;
};

template<class ContainerAllocator>
struct DataType< ::alarm_device::alarm_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "alarm_device/alarm_srvRequest";
  }

  static const char* value(const ::alarm_device::alarm_srvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::alarm_device::alarm_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 start_play\n"
"int64 volume\n"
"int64 loop_mode\n"
"int64 filename\n"
"int64 fileorder\n"
"int64[] list_n\n"
;
  }

  static const char* value(const ::alarm_device::alarm_srvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::alarm_device::alarm_srvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.start_play);
      stream.next(m.volume);
      stream.next(m.loop_mode);
      stream.next(m.filename);
      stream.next(m.fileorder);
      stream.next(m.list_n);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct alarm_srvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::alarm_device::alarm_srvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::alarm_device::alarm_srvRequest_<ContainerAllocator>& v)
  {
    s << indent << "start_play: ";
    Printer<int64_t>::stream(s, indent + "  ", v.start_play);
    s << indent << "volume: ";
    Printer<int64_t>::stream(s, indent + "  ", v.volume);
    s << indent << "loop_mode: ";
    Printer<int64_t>::stream(s, indent + "  ", v.loop_mode);
    s << indent << "filename: ";
    Printer<int64_t>::stream(s, indent + "  ", v.filename);
    s << indent << "fileorder: ";
    Printer<int64_t>::stream(s, indent + "  ", v.fileorder);
    s << indent << "list_n[]" << std::endl;
    for (size_t i = 0; i < v.list_n.size(); ++i)
    {
      s << indent << "  list_n[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.list_n[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ALARM_DEVICE_MESSAGE_ALARM_SRVREQUEST_H
