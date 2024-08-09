// Auto-generated. Do not edit!

// (in-package robot_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class nav_goalRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.th = null;
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
      if (initObj.hasOwnProperty('th')) {
        this.th = initObj.th
      }
      else {
        this.th = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type nav_goalRequest
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [th]
    bufferOffset = _serializer.float64(obj.th, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type nav_goalRequest
    let len;
    let data = new nav_goalRequest(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [th]
    data.th = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msgs/nav_goalRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '000e435776f4fd6ba555d25d7a61ed8f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x
    float64 y
    float64 th
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new nav_goalRequest(null);
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

    if (msg.th !== undefined) {
      resolved.th = msg.th;
    }
    else {
      resolved.th = 0.0
    }

    return resolved;
    }
};

class nav_goalResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.th = null;
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('th')) {
        this.th = initObj.th
      }
      else {
        this.th = 0;
      }
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = 0;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type nav_goalResponse
    // Serialize message field [th]
    bufferOffset = _serializer.int32(obj.th, buffer, bufferOffset);
    // Serialize message field [success]
    bufferOffset = _serializer.int8(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type nav_goalResponse
    let len;
    let data = new nav_goalResponse(null);
    // Deserialize message field [th]
    data.th = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [success]
    data.success = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.message.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msgs/nav_goalResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '130d3c324d2926d74adbb83f071eb265';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 th
    int8 success
    string message
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new nav_goalResponse(null);
    if (msg.th !== undefined) {
      resolved.th = msg.th;
    }
    else {
      resolved.th = 0
    }

    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = 0
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: nav_goalRequest,
  Response: nav_goalResponse,
  md5sum() { return '6f7829491dcb15f3121622bb0d29b3ea'; },
  datatype() { return 'robot_msgs/nav_goal'; }
};
