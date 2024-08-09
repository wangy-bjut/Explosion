// Auto-generated. Do not edit!

// (in-package robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let cloud_angletims = require('./cloud_angletims.js');
let cloud_control = require('./cloud_control.js');

//-----------------------------------------------------------

class camera {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.angle = null;
      this.control = null;
    }
    else {
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = new cloud_angletims();
      }
      if (initObj.hasOwnProperty('control')) {
        this.control = initObj.control
      }
      else {
        this.control = new cloud_control();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type camera
    // Serialize message field [angle]
    bufferOffset = cloud_angletims.serialize(obj.angle, buffer, bufferOffset);
    // Serialize message field [control]
    bufferOffset = cloud_control.serialize(obj.control, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type camera
    let len;
    let data = new camera(null);
    // Deserialize message field [angle]
    data.angle = cloud_angletims.deserialize(buffer, bufferOffset);
    // Deserialize message field [control]
    data.control = cloud_control.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += cloud_control.getMessageSize(object.control);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msgs/camera';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1dbe9d74bdb2340b22cd82e8b27560c6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    robot_msgs/cloud_angletims angle
    robot_msgs/cloud_control control 
    ================================================================================
    MSG: robot_msgs/cloud_angletims
    float32 yaw
    float32 pitch
    ================================================================================
    MSG: robot_msgs/cloud_control
    string direction
    float64 angular_percent
    bool zero
    bool scrub
    bool light
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new camera(null);
    if (msg.angle !== undefined) {
      resolved.angle = cloud_angletims.Resolve(msg.angle)
    }
    else {
      resolved.angle = new cloud_angletims()
    }

    if (msg.control !== undefined) {
      resolved.control = cloud_control.Resolve(msg.control)
    }
    else {
      resolved.control = new cloud_control()
    }

    return resolved;
    }
};

module.exports = camera;
