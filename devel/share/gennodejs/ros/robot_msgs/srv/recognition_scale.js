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

class recognition_scaleRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start = null;
    }
    else {
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type recognition_scaleRequest
    // Serialize message field [start]
    bufferOffset = _serializer.bool(obj.start, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type recognition_scaleRequest
    let len;
    let data = new recognition_scaleRequest(null);
    // Deserialize message field [start]
    data.start = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msgs/recognition_scaleRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '676aa7bfb3ec2071e814f2368dfd5fb5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool start
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new recognition_scaleRequest(null);
    if (msg.start !== undefined) {
      resolved.start = msg.start;
    }
    else {
      resolved.start = false
    }

    return resolved;
    }
};

class recognition_scaleResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.image_path = null;
      this.result = null;
      this.time = null;
    }
    else {
      if (initObj.hasOwnProperty('image_path')) {
        this.image_path = initObj.image_path
      }
      else {
        this.image_path = '';
      }
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = 0.0;
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type recognition_scaleResponse
    // Serialize message field [image_path]
    bufferOffset = _serializer.string(obj.image_path, buffer, bufferOffset);
    // Serialize message field [result]
    bufferOffset = _serializer.float64(obj.result, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.string(obj.time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type recognition_scaleResponse
    let len;
    let data = new recognition_scaleResponse(null);
    // Deserialize message field [image_path]
    data.image_path = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [result]
    data.result = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.image_path.length;
    length += object.time.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msgs/recognition_scaleResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3cfa4c62e2f8f57ddf8e725449d7973d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string image_path
    float64 result
    string time
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new recognition_scaleResponse(null);
    if (msg.image_path !== undefined) {
      resolved.image_path = msg.image_path;
    }
    else {
      resolved.image_path = ''
    }

    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = 0.0
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: recognition_scaleRequest,
  Response: recognition_scaleResponse,
  md5sum() { return '517170519764f280df543ca1d4bff866'; },
  datatype() { return 'robot_msgs/recognition_scale'; }
};
