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

class alarm_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.volume = null;
      this.loop_mode = null;
      this.filename = null;
      this.fileorder = null;
    }
    else {
      if (initObj.hasOwnProperty('volume')) {
        this.volume = initObj.volume
      }
      else {
        this.volume = 0;
      }
      if (initObj.hasOwnProperty('loop_mode')) {
        this.loop_mode = initObj.loop_mode
      }
      else {
        this.loop_mode = 0;
      }
      if (initObj.hasOwnProperty('filename')) {
        this.filename = initObj.filename
      }
      else {
        this.filename = 0;
      }
      if (initObj.hasOwnProperty('fileorder')) {
        this.fileorder = initObj.fileorder
      }
      else {
        this.fileorder = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type alarm_srvRequest
    // Serialize message field [volume]
    bufferOffset = _serializer.int64(obj.volume, buffer, bufferOffset);
    // Serialize message field [loop_mode]
    bufferOffset = _serializer.int64(obj.loop_mode, buffer, bufferOffset);
    // Serialize message field [filename]
    bufferOffset = _serializer.int64(obj.filename, buffer, bufferOffset);
    // Serialize message field [fileorder]
    bufferOffset = _serializer.int64(obj.fileorder, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type alarm_srvRequest
    let len;
    let data = new alarm_srvRequest(null);
    // Deserialize message field [volume]
    data.volume = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [loop_mode]
    data.loop_mode = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [filename]
    data.filename = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [fileorder]
    data.fileorder = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msgs/alarm_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0c3a816de693ddb394770c51f8487b31';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 volume
    int64 loop_mode
    int64 filename
    int64 fileorder
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new alarm_srvRequest(null);
    if (msg.volume !== undefined) {
      resolved.volume = msg.volume;
    }
    else {
      resolved.volume = 0
    }

    if (msg.loop_mode !== undefined) {
      resolved.loop_mode = msg.loop_mode;
    }
    else {
      resolved.loop_mode = 0
    }

    if (msg.filename !== undefined) {
      resolved.filename = msg.filename;
    }
    else {
      resolved.filename = 0
    }

    if (msg.fileorder !== undefined) {
      resolved.fileorder = msg.fileorder;
    }
    else {
      resolved.fileorder = 0
    }

    return resolved;
    }
};

class alarm_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type alarm_srvResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type alarm_srvResponse
    let len;
    let data = new alarm_srvResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msgs/alarm_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb13ac1f1354ccecb7941ee8fa2192e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool result
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new alarm_srvResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    return resolved;
    }
};

module.exports = {
  Request: alarm_srvRequest,
  Response: alarm_srvResponse,
  md5sum() { return 'a8f167451be4b108ffefdf3f150aa1b6'; },
  datatype() { return 'robot_msgs/alarm_srv'; }
};
