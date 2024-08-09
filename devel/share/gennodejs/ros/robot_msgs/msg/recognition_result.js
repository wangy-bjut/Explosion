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

class recognition_result {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
      this.picture_path = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = 0.0;
      }
      if (initObj.hasOwnProperty('picture_path')) {
        this.picture_path = initObj.picture_path
      }
      else {
        this.picture_path = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type recognition_result
    // Serialize message field [result]
    bufferOffset = _serializer.float64(obj.result, buffer, bufferOffset);
    // Serialize message field [picture_path]
    bufferOffset = _serializer.string(obj.picture_path, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type recognition_result
    let len;
    let data = new recognition_result(null);
    // Deserialize message field [result]
    data.result = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [picture_path]
    data.picture_path = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.picture_path.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msgs/recognition_result';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd1ac07c1008c1e8b1c60798b28200991';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 result
    string picture_path
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new recognition_result(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = 0.0
    }

    if (msg.picture_path !== undefined) {
      resolved.picture_path = msg.picture_path;
    }
    else {
      resolved.picture_path = ''
    }

    return resolved;
    }
};

module.exports = recognition_result;
