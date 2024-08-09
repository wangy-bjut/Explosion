# Install script for directory: /home/robot/Explosion_proof_robot/src/robot_msgs

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msgs/msg" TYPE FILE FILES
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msgs/srv" TYPE FILE FILES
    "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv"
    "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msgs/action" TYPE FILE FILES "/home/robot/Explosion_proof_robot/src/robot_msgs/action/center.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msgs/msg" TYPE FILE FILES
    "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg"
    "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg"
    "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg"
    "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg"
    "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg"
    "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg"
    "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msgs/cmake" TYPE FILE FILES "/home/robot/Explosion_proof_robot/build/robot_msgs/catkin_generated/installspace/robot_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/robot/Explosion_proof_robot/devel/include/robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/robot/Explosion_proof_robot/devel/share/roseus/ros/robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/robot/Explosion_proof_robot/devel/share/common-lisp/ros/robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/robot/Explosion_proof_robot/devel/share/gennodejs/ros/robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/robot/Explosion_proof_robot/devel/lib/python2.7/dist-packages/robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/robot/Explosion_proof_robot/devel/lib/python2.7/dist-packages/robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/robot/Explosion_proof_robot/build/robot_msgs/catkin_generated/installspace/robot_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msgs/cmake" TYPE FILE FILES "/home/robot/Explosion_proof_robot/build/robot_msgs/catkin_generated/installspace/robot_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msgs/cmake" TYPE FILE FILES
    "/home/robot/Explosion_proof_robot/build/robot_msgs/catkin_generated/installspace/robot_msgsConfig.cmake"
    "/home/robot/Explosion_proof_robot/build/robot_msgs/catkin_generated/installspace/robot_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msgs" TYPE FILE FILES "/home/robot/Explosion_proof_robot/src/robot_msgs/package.xml")
endif()

