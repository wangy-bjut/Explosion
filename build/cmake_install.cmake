# Install script for directory: /home/robot/Explosion_proof_robot/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/robot/Explosion_proof_robot/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/Explosion_proof_robot/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/Explosion_proof_robot/install" TYPE PROGRAM FILES "/home/robot/Explosion_proof_robot/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/Explosion_proof_robot/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/Explosion_proof_robot/install" TYPE PROGRAM FILES "/home/robot/Explosion_proof_robot/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/Explosion_proof_robot/install/setup.bash;/home/robot/Explosion_proof_robot/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/Explosion_proof_robot/install" TYPE FILE FILES
    "/home/robot/Explosion_proof_robot/build/catkin_generated/installspace/setup.bash"
    "/home/robot/Explosion_proof_robot/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/Explosion_proof_robot/install/setup.sh;/home/robot/Explosion_proof_robot/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/Explosion_proof_robot/install" TYPE FILE FILES
    "/home/robot/Explosion_proof_robot/build/catkin_generated/installspace/setup.sh"
    "/home/robot/Explosion_proof_robot/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/Explosion_proof_robot/install/setup.zsh;/home/robot/Explosion_proof_robot/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/Explosion_proof_robot/install" TYPE FILE FILES
    "/home/robot/Explosion_proof_robot/build/catkin_generated/installspace/setup.zsh"
    "/home/robot/Explosion_proof_robot/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/Explosion_proof_robot/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/Explosion_proof_robot/install" TYPE FILE FILES "/home/robot/Explosion_proof_robot/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/robot/Explosion_proof_robot/build/gtest/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/ros_rslidar/rslidar/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/ACERMAN-LeGO-LOAM/cloud_msgs/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/ros_rslidar/rslidar_msgs/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/handsfree_ros_imu/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/robot_msgs/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/alarm_announce/alarm_device/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/camera_temp/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/detection_service/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/gas_alarm/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/robot_artificial/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/robot_base/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/robot_center/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/robot_joy/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/rplidar_ros/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/ros_rslidar/rslidar_sync/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/ACERMAN-LeGO-LOAM/LeGO-LOAM/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/robot_gps/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/rs_to_velodyne/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/ros_rslidar/rslidar_driver/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/ros_rslidar/rslidar_pointcloud/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/robot_gazebo/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/robot_description/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/robot_slam/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/velodyne_gazebo_plugins/cmake_install.cmake")
  include("/home/robot/Explosion_proof_robot/build/robot_navigation/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/robot/Explosion_proof_robot/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
