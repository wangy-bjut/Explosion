cmake_minimum_required(VERSION 3.0.2)
project(robot_center)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  sensor_msgs
  nav_msgs
  robot_msgs
  roscpp
  rospy
  std_msgs
  actionlib_msgs
  actionlib
  genmsg
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES robot_center
#  CATKIN_DEPENDS roscpp rospy std_msgs
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
  include 
  ../alarm_announce/alarm_device/include 
  ${catkin_INCLUDE_DIRS}
# include
)
link_directories(/usr/local/lib)



add_executable(center
  src/center.cpp
)
add_dependencies(center ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(center
  jsoncpp
  ${catkin_LIBRARIES}
)

add_executable(center_client
  src/center_client.cpp
)
add_dependencies(center_client ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(center_client
  ${catkin_LIBRARIES}
)


