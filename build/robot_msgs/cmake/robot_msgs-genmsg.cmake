# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robot_msgs: 20 messages, 8 services")

set(MSG_I_FLAGS "-Irobot_msgs:/home/robot/Explosion_proof_robot/src/robot_msgs/msg;-Irobot_msgs:/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robot_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:robot_msgs/centerFeedback:std_msgs/Header"
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg" "robot_msgs/centerResult:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:std_msgs/Header"
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg" "robot_msgs/robot_pose:robot_msgs/robot_cmd:robot_msgs/cloud_angletims:robot_msgs/gas_result:robot_msgs/temp_result:robot_msgs/camera:robot_msgs/cloud_control:robot_msgs/chasis:robot_msgs/recognition_result"
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg" "actionlib_msgs/GoalID:robot_msgs/centerActionResult:actionlib_msgs/GoalStatus:robot_msgs/centerFeedback:robot_msgs/centerGoal:robot_msgs/centerResult:robot_msgs/centerActionFeedback:std_msgs/Header:robot_msgs/centerActionGoal"
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg" "robot_msgs/robot_cmd:robot_msgs/robot_pose"
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg" ""
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg" "actionlib_msgs/GoalID:robot_msgs/centerGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg" "robot_msgs/cloud_control:robot_msgs/cloud_angletims"
)

get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv" NAME_WE)
add_custom_target(_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msgs" "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_msg_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)

### Generating Services
_generate_srv_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_srv_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_srv_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_srv_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_srv_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_srv_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_srv_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)
_generate_srv_cpp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
)

### Generating Module File
_generate_module_cpp(robot_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robot_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robot_msgs_generate_messages robot_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_cpp _robot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_msgs_gencpp)
add_dependencies(robot_msgs_gencpp robot_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_msg_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)

### Generating Services
_generate_srv_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_srv_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_srv_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_srv_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_srv_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_srv_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_srv_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)
_generate_srv_eus(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
)

### Generating Module File
_generate_module_eus(robot_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(robot_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(robot_msgs_generate_messages robot_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_eus _robot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_msgs_geneus)
add_dependencies(robot_msgs_geneus robot_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_msg_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)

### Generating Services
_generate_srv_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_srv_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_srv_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_srv_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_srv_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_srv_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_srv_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)
_generate_srv_lisp(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
)

### Generating Module File
_generate_module_lisp(robot_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robot_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robot_msgs_generate_messages robot_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_lisp _robot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_msgs_genlisp)
add_dependencies(robot_msgs_genlisp robot_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_msg_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)

### Generating Services
_generate_srv_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_srv_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_srv_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_srv_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_srv_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_srv_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_srv_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)
_generate_srv_nodejs(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
)

### Generating Module File
_generate_module_nodejs(robot_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(robot_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(robot_msgs_generate_messages robot_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_nodejs _robot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_msgs_gennodejs)
add_dependencies(robot_msgs_gennodejs robot_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg"
  "${MSG_I_FLAGS}"
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg;/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_msg_py(robot_msgs
  "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)

### Generating Services
_generate_srv_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_srv_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_srv_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_srv_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_srv_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_srv_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_srv_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)
_generate_srv_py(robot_msgs
  "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
)

### Generating Module File
_generate_module_py(robot_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robot_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robot_msgs_generate_messages robot_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionFeedback.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/recognition_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_pose.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerGoal.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/gas_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/temp_result.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/IoStatus.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionResult.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/alarm_srv.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Gas_alarm.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/Integrator.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerFeedback.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/recognition_scale.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/robot_cmd.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/PtzPreset.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/ackerman_control.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/nav_goal.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/Float64.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerResult.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerAction.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/chasis.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/setint16.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_angletims.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/dgps.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/cloud_control.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/devel/share/robot_msgs/msg/centerActionGoal.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/msg/camera.msg" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/Explosion_proof_robot/src/robot_msgs/srv/temp_detection.srv" NAME_WE)
add_dependencies(robot_msgs_generate_messages_py _robot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_msgs_genpy)
add_dependencies(robot_msgs_genpy robot_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(robot_msgs_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(robot_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(robot_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(robot_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(robot_msgs_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(robot_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(robot_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(robot_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(robot_msgs_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(robot_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(robot_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(robot_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(robot_msgs_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(robot_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(robot_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(robot_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(robot_msgs_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(robot_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(robot_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(robot_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
