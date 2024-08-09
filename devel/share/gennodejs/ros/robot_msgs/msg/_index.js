
"use strict";

let dgps = require('./dgps.js');
let ackerman_control = require('./ackerman_control.js');
let gas_result = require('./gas_result.js');
let IoStatus = require('./IoStatus.js');
let Integrator = require('./Integrator.js');
let temp_result = require('./temp_result.js');
let robot_cmd = require('./robot_cmd.js');
let cloud_angletims = require('./cloud_angletims.js');
let chasis = require('./chasis.js');
let recognition_result = require('./recognition_result.js');
let cloud_control = require('./cloud_control.js');
let robot_pose = require('./robot_pose.js');
let camera = require('./camera.js');
let centerResult = require('./centerResult.js');
let centerActionFeedback = require('./centerActionFeedback.js');
let centerActionGoal = require('./centerActionGoal.js');
let centerActionResult = require('./centerActionResult.js');
let centerAction = require('./centerAction.js');
let centerFeedback = require('./centerFeedback.js');
let centerGoal = require('./centerGoal.js');

module.exports = {
  dgps: dgps,
  ackerman_control: ackerman_control,
  gas_result: gas_result,
  IoStatus: IoStatus,
  Integrator: Integrator,
  temp_result: temp_result,
  robot_cmd: robot_cmd,
  cloud_angletims: cloud_angletims,
  chasis: chasis,
  recognition_result: recognition_result,
  cloud_control: cloud_control,
  robot_pose: robot_pose,
  camera: camera,
  centerResult: centerResult,
  centerActionFeedback: centerActionFeedback,
  centerActionGoal: centerActionGoal,
  centerActionResult: centerActionResult,
  centerAction: centerAction,
  centerFeedback: centerFeedback,
  centerGoal: centerGoal,
};
