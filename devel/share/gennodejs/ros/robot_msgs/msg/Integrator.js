// Auto-generated. Do not edit!

// (in-package robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let chasis = require('./chasis.js');
let camera = require('./camera.js');
let gas_result = require('./gas_result.js');
let temp_result = require('./temp_result.js');
let recognition_result = require('./recognition_result.js');

//-----------------------------------------------------------

class Integrator {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.point_name = null;
      this.time = null;
      this.chasis = null;
      this.camera = null;
      this.gas = null;
      this.temp = null;
      this.recognition = null;
    }
    else {
      if (initObj.hasOwnProperty('point_name')) {
        this.point_name = initObj.point_name
      }
      else {
        this.point_name = '';
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = '';
      }
      if (initObj.hasOwnProperty('chasis')) {
        this.chasis = initObj.chasis
      }
      else {
        this.chasis = new chasis();
      }
      if (initObj.hasOwnProperty('camera')) {
        this.camera = initObj.camera
      }
      else {
        this.camera = new camera();
      }
      if (initObj.hasOwnProperty('gas')) {
        this.gas = initObj.gas
      }
      else {
        this.gas = new gas_result();
      }
      if (initObj.hasOwnProperty('temp')) {
        this.temp = initObj.temp
      }
      else {
        this.temp = new temp_result();
      }
      if (initObj.hasOwnProperty('recognition')) {
        this.recognition = initObj.recognition
      }
      else {
        this.recognition = new recognition_result();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Integrator
    // Serialize message field [point_name]
    bufferOffset = _serializer.string(obj.point_name, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.string(obj.time, buffer, bufferOffset);
    // Serialize message field [chasis]
    bufferOffset = chasis.serialize(obj.chasis, buffer, bufferOffset);
    // Serialize message field [camera]
    bufferOffset = camera.serialize(obj.camera, buffer, bufferOffset);
    // Serialize message field [gas]
    bufferOffset = gas_result.serialize(obj.gas, buffer, bufferOffset);
    // Serialize message field [temp]
    bufferOffset = temp_result.serialize(obj.temp, buffer, bufferOffset);
    // Serialize message field [recognition]
    bufferOffset = recognition_result.serialize(obj.recognition, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Integrator
    let len;
    let data = new Integrator(null);
    // Deserialize message field [point_name]
    data.point_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [chasis]
    data.chasis = chasis.deserialize(buffer, bufferOffset);
    // Deserialize message field [camera]
    data.camera = camera.deserialize(buffer, bufferOffset);
    // Deserialize message field [gas]
    data.gas = gas_result.deserialize(buffer, bufferOffset);
    // Deserialize message field [temp]
    data.temp = temp_result.deserialize(buffer, bufferOffset);
    // Deserialize message field [recognition]
    data.recognition = recognition_result.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.point_name.length;
    length += object.time.length;
    length += camera.getMessageSize(object.camera);
    length += recognition_result.getMessageSize(object.recognition);
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msgs/Integrator';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '605f26ed16563eb16c6f892df92d7968';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string point_name
    string time
    robot_msgs/chasis chasis
    robot_msgs/camera camera
    robot_msgs/gas_result gas
    robot_msgs/temp_result temp
    robot_msgs/recognition_result recognition
    ================================================================================
    MSG: robot_msgs/chasis
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
    ================================================================================
    MSG: robot_msgs/camera
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
    ================================================================================
    MSG: robot_msgs/gas_result
    float32 result
    ================================================================================
    MSG: robot_msgs/temp_result
    float64 result
    ================================================================================
    MSG: robot_msgs/recognition_result
    float64 result
    string picture_path
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Integrator(null);
    if (msg.point_name !== undefined) {
      resolved.point_name = msg.point_name;
    }
    else {
      resolved.point_name = ''
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = ''
    }

    if (msg.chasis !== undefined) {
      resolved.chasis = chasis.Resolve(msg.chasis)
    }
    else {
      resolved.chasis = new chasis()
    }

    if (msg.camera !== undefined) {
      resolved.camera = camera.Resolve(msg.camera)
    }
    else {
      resolved.camera = new camera()
    }

    if (msg.gas !== undefined) {
      resolved.gas = gas_result.Resolve(msg.gas)
    }
    else {
      resolved.gas = new gas_result()
    }

    if (msg.temp !== undefined) {
      resolved.temp = temp_result.Resolve(msg.temp)
    }
    else {
      resolved.temp = new temp_result()
    }

    if (msg.recognition !== undefined) {
      resolved.recognition = recognition_result.Resolve(msg.recognition)
    }
    else {
      resolved.recognition = new recognition_result()
    }

    return resolved;
    }
};

module.exports = Integrator;
