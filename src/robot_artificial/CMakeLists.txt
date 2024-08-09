cmake_minimum_required(VERSION 3.0.2)
project(robot_artificial)



find_package(catkin REQUIRED COMPONENTS
  robot_msgs
  roscpp
  rospy
  std_msgs
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES robot_artificial
#  CATKIN_DEPENDS roscpp rospy std_msgs
#  DEPENDS system_lib
)


include_directories(
# include
  ${catkin_INCLUDE_DIRS}
 /usr/include/eigen3/Eigen/Dense
)


add_executable(artificial
  src/artificial.cpp
)
add_dependencies(artificial ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(artificial
  ${catkin_LIBRARIES}
)




add_executable(artificial1
  src/artificial1.cpp
)
add_dependencies(artificial1 ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(artificial1
  ${catkin_LIBRARIES}
)
