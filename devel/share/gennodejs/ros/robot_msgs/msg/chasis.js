// Auto-generated. Do not edit!

// (in-package robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let robot_pose = require('./robot_pose.js');
let robot_cmd = require('./robot_cmd.js');

//-----------------------------------------------------------

class chasis {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pose = null;
      this.cmd = null;
    }
    else {
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new robot_pose();
      }
      if (initObj.hasOwnProperty('cmd')) {
        this.cmd = initObj.cmd
      }
      else {
        this.cmd = new robot_cmd();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type chasis
    // Serialize message field [pose]
    bufferOffset = robot_pose.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [cmd]
    bufferOffset = robot_cmd.serialize(obj.cmd, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type chasis
    let len;
    let data = new chasis(null);
    // Deserialize message field [pose]
    data.pose = robot_pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [cmd]
    data.cmd = robot_cmd.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msgs/chasis';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3692867e47a9cfbea9dd44466659fd6d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    robot_msgs/robot_pose pose
    robot_msgs/robot_cmd cmd
    ================================================================================
    MSG: robot_msgs/robot_pose
    float32 x
    float32 y
    float32 yaw
    ================================================================================
    MSG: robot_msgs/robot_cmd
    float32 linear
    float32 angular
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new chasis(null);
    if (msg.pose !== undefined) {
      resolved.pose = robot_pose.Resolve(msg.pose)
    }
    else {
      resolved.pose = new robot_pose()
    }

    if (msg.cmd !== undefined) {
      resolved.cmd = robot_cmd.Resolve(msg.cmd)
    }
    else {
      resolved.cmd = new robot_cmd()
    }

    return resolved;
    }
};

module.exports = chasis;
