// Auto-generated. Do not edit!

// (in-package robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class dgps {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
      this.roll = null;
      this.pitch = null;
      this.yaw = null;
      this.by_pose0 = null;
      this.by_pose1 = null;
      this.sin_th_q1 = null;
      this.cos_th_q1 = null;
      this.sin_th = null;
      this.cos_th = null;
      this.bbyyy = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('by_pose0')) {
        this.by_pose0 = initObj.by_pose0
      }
      else {
        this.by_pose0 = 0.0;
      }
      if (initObj.hasOwnProperty('by_pose1')) {
        this.by_pose1 = initObj.by_pose1
      }
      else {
        this.by_pose1 = 0.0;
      }
      if (initObj.hasOwnProperty('sin_th_q1')) {
        this.sin_th_q1 = initObj.sin_th_q1
      }
      else {
        this.sin_th_q1 = 0.0;
      }
      if (initObj.hasOwnProperty('cos_th_q1')) {
        this.cos_th_q1 = initObj.cos_th_q1
      }
      else {
        this.cos_th_q1 = 0.0;
      }
      if (initObj.hasOwnProperty('sin_th')) {
        this.sin_th = initObj.sin_th
      }
      else {
        this.sin_th = 0.0;
      }
      if (initObj.hasOwnProperty('cos_th')) {
        this.cos_th = initObj.cos_th
      }
      else {
        this.cos_th = 0.0;
      }
      if (initObj.hasOwnProperty('bbyyy')) {
        this.bbyyy = initObj.bbyyy
      }
      else {
        this.bbyyy = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type dgps
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float64(obj.z, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.float64(obj.roll, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float64(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float64(obj.yaw, buffer, bufferOffset);
    // Serialize message field [by_pose0]
    bufferOffset = _serializer.float64(obj.by_pose0, buffer, bufferOffset);
    // Serialize message field [by_pose1]
    bufferOffset = _serializer.float64(obj.by_pose1, buffer, bufferOffset);
    // Serialize message field [sin_th_q1]
    bufferOffset = _serializer.float64(obj.sin_th_q1, buffer, bufferOffset);
    // Serialize message field [cos_th_q1]
    bufferOffset = _serializer.float64(obj.cos_th_q1, buffer, bufferOffset);
    // Serialize message field [sin_th]
    bufferOffset = _serializer.float64(obj.sin_th, buffer, bufferOffset);
    // Serialize message field [cos_th]
    bufferOffset = _serializer.float64(obj.cos_th, buffer, bufferOffset);
    // Serialize message field [bbyyy]
    bufferOffset = _serializer.float64(obj.bbyyy, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type dgps
    let len;
    let data = new dgps(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [by_pose0]
    data.by_pose0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [by_pose1]
    data.by_pose1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sin_th_q1]
    data.sin_th_q1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cos_th_q1]
    data.cos_th_q1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sin_th]
    data.sin_th = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cos_th]
    data.cos_th = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [bbyyy]
    data.bbyyy = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 104;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msgs/dgps';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c990cbed4ebc800837d6877b60880af5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x
    float64 y
    float64 z
    float64 roll
    float64 pitch
    float64 yaw
    float64 by_pose0
    float64 by_pose1
    float64 sin_th_q1
    float64 cos_th_q1
    float64 sin_th
    float64 cos_th
    float64 bbyyy
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new dgps(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.by_pose0 !== undefined) {
      resolved.by_pose0 = msg.by_pose0;
    }
    else {
      resolved.by_pose0 = 0.0
    }

    if (msg.by_pose1 !== undefined) {
      resolved.by_pose1 = msg.by_pose1;
    }
    else {
      resolved.by_pose1 = 0.0
    }

    if (msg.sin_th_q1 !== undefined) {
      resolved.sin_th_q1 = msg.sin_th_q1;
    }
    else {
      resolved.sin_th_q1 = 0.0
    }

    if (msg.cos_th_q1 !== undefined) {
      resolved.cos_th_q1 = msg.cos_th_q1;
    }
    else {
      resolved.cos_th_q1 = 0.0
    }

    if (msg.sin_th !== undefined) {
      resolved.sin_th = msg.sin_th;
    }
    else {
      resolved.sin_th = 0.0
    }

    if (msg.cos_th !== undefined) {
      resolved.cos_th = msg.cos_th;
    }
    else {
      resolved.cos_th = 0.0
    }

    if (msg.bbyyy !== undefined) {
      resolved.bbyyy = msg.bbyyy;
    }
    else {
      resolved.bbyyy = 0.0
    }

    return resolved;
    }
};

module.exports = dgps;
