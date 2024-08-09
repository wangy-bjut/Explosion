cmake_minimum_required(VERSION 3.0.2)
project(robot_base)


find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  serial
  std_msgs
  robot_msgs
  tf
  cv_bridge
)


find_package(Boost REQUIRED COMPONENTS system thread filesystem )
add_compile_options(-std=c++11)


catkin_package(

)


include_directories(
  include/robot_base
  ${catkin_INCLUDE_DIRS}
)
link_directories(

)  

add_executable(
  robot_controller src/robot_controller_node.cpp 
  include/robot_base/robot_manager.cpp
  )



target_link_libraries(
  robot_controller
  ${catkin_LIBRARIES} ${MAP}
)


