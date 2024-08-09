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

class cloud_control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.direction = null;
      this.angular_percent = null;
      this.zero = null;
      this.scrub = null;
      this.light = null;
    }
    else {
      if (initObj.hasOwnProperty('direction')) {
        this.direction = initObj.direction
      }
      else {
        this.direction = '';
      }
      if (initObj.hasOwnProperty('angular_percent')) {
        this.angular_percent = initObj.angular_percent
      }
      else {
        this.angular_percent = 0.0;
      }
      if (initObj.hasOwnProperty('zero')) {
        this.zero = initObj.zero
      }
      else {
        this.zero = false;
      }
      if (initObj.hasOwnProperty('scrub')) {
        this.scrub = initObj.scrub
      }
      else {
        this.scrub = false;
      }
      if (initObj.hasOwnProperty('light')) {
        this.light = initObj.light
      }
      else {
        this.light = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cloud_control
    // Serialize message field [direction]
    bufferOffset = _serializer.string(obj.direction, buffer, bufferOffset);
    // Serialize message field [angular_percent]
    bufferOffset = _serializer.float64(obj.angular_percent, buffer, bufferOffset);
    // Serialize message field [zero]
    bufferOffset = _serializer.bool(obj.zero, buffer, bufferOffset);
    // Serialize message field [scrub]
    bufferOffset = _serializer.bool(obj.scrub, buffer, bufferOffset);
    // Serialize message field [light]
    bufferOffset = _serializer.bool(obj.light, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cloud_control
    let len;
    let data = new cloud_control(null);
    // Deserialize message field [direction]
    data.direction = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [angular_percent]
    data.angular_percent = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [zero]
    data.zero = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [scrub]
    data.scrub = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [light]
    data.light = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.direction.length;
    return length + 15;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msgs/cloud_control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8a0daeeb4fd2f539306a2fb5b806e7f7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new cloud_control(null);
    if (msg.direction !== undefined) {
      resolved.direction = msg.direction;
    }
    else {
      resolved.direction = ''
    }

    if (msg.angular_percent !== undefined) {
      resolved.angular_percent = msg.angular_percent;
    }
    else {
      resolved.angular_percent = 0.0
    }

    if (msg.zero !== undefined) {
      resolved.zero = msg.zero;
    }
    else {
      resolved.zero = false
    }

    if (msg.scrub !== undefined) {
      resolved.scrub = msg.scrub;
    }
    else {
      resolved.scrub = false
    }

    if (msg.light !== undefined) {
      resolved.light = msg.light;
    }
    else {
      resolved.light = false
    }

    return resolved;
    }
};

module.exports = cloud_control;
