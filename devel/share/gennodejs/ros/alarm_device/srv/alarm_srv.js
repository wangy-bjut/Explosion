// Auto-generated. Do not edit!

// (in-package alarm_device.srv)


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
      this.start_play = null;
      this.volume = null;
      this.loop_mode = null;
      this.filename = null;
      this.fileorder = null;
      this.list_n = null;
    }
    else {
      if (initObj.hasOwnProperty('start_play')) {
        this.start_play = initObj.start_play
      }
      else {
        this.start_play = 0;
      }
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
      if (initObj.hasOwnProperty('list_n')) {
        this.list_n = initObj.list_n
      }
      else {
        this.list_n = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type alarm_srvRequest
    // Serialize message field [start_play]
    bufferOffset = _serializer.int64(obj.start_play, buffer, bufferOffset);
    // Serialize message field [volume]
    bufferOffset = _serializer.int64(obj.volume, buffer, bufferOffset);
    // Serialize message field [loop_mode]
    bufferOffset = _serializer.int64(obj.loop_mode, buffer, bufferOffset);
    // Serialize message field [filename]
    bufferOffset = _serializer.int64(obj.filename, buffer, bufferOffset);
    // Serialize message field [fileorder]
    bufferOffset = _serializer.int64(obj.fileorder, buffer, bufferOffset);
    // Serialize message field [list_n]
    bufferOffset = _arraySerializer.int64(obj.list_n, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type alarm_srvRequest
    let len;
    let data = new alarm_srvRequest(null);
    // Deserialize message field [start_play]
    data.start_play = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [volume]
    data.volume = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [loop_mode]
    data.loop_mode = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [filename]
    data.filename = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [fileorder]
    data.fileorder = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [list_n]
    data.list_n = _arrayDeserializer.int64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.list_n.length;
    return length + 44;
  }

  static datatype() {
    // Returns string type for a service object
    return 'alarm_device/alarm_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eba3e264b7446975115540c352322db3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 start_play
    int64 volume
    int64 loop_mode
    int64 filename
    int64 fileorder
    int64[] list_n
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new alarm_srvRequest(null);
    if (msg.start_play !== undefined) {
      resolved.start_play = msg.start_play;
    }
    else {
      resolved.start_play = 0
    }

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

    if (msg.list_n !== undefined) {
      resolved.list_n = msg.list_n;
    }
    else {
      resolved.list_n = []
    }

    return resolved;
    }
};

class alarm_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type alarm_srvResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type alarm_srvResponse
    let len;
    let data = new alarm_srvResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'alarm_device/alarm_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new alarm_srvResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: alarm_srvRequest,
  Response: alarm_srvResponse,
  md5sum() { return 'eba3e264b7446975115540c352322db3'; },
  datatype() { return 'alarm_device/alarm_srv'; }
};
