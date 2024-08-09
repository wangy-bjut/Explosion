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

class IoStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status_stop = null;
      this.status_slow = null;
    }
    else {
      if (initObj.hasOwnProperty('status_stop')) {
        this.status_stop = initObj.status_stop
      }
      else {
        this.status_stop = 0;
      }
      if (initObj.hasOwnProperty('status_slow')) {
        this.status_slow = initObj.status_slow
      }
      else {
        this.status_slow = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IoStatus
    // Serialize message field [status_stop]
    bufferOffset = _serializer.int8(obj.status_stop, buffer, bufferOffset);
    // Serialize message field [status_slow]
    bufferOffset = _serializer.int8(obj.status_slow, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IoStatus
    let len;
    let data = new IoStatus(null);
    // Deserialize message field [status_stop]
    data.status_stop = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [status_slow]
    data.status_slow = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msgs/IoStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8c8bf31ab13adffd23ec7ea73641f167';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 status_stop
    int8 status_slow
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IoStatus(null);
    if (msg.status_stop !== undefined) {
      resolved.status_stop = msg.status_stop;
    }
    else {
      resolved.status_stop = 0
    }

    if (msg.status_slow !== undefined) {
      resolved.status_slow = msg.status_slow;
    }
    else {
      resolved.status_slow = 0
    }

    return resolved;
    }
};

module.exports = IoStatus;
