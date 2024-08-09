
"use strict";

let recognition_scale = require('./recognition_scale.js')
let setint16 = require('./setint16.js')
let Float64 = require('./Float64.js')
let PtzPreset = require('./PtzPreset.js')
let nav_goal = require('./nav_goal.js')
let alarm_srv = require('./alarm_srv.js')
let temp_detection = require('./temp_detection.js')
let Gas_alarm = require('./Gas_alarm.js')

module.exports = {
  recognition_scale: recognition_scale,
  setint16: setint16,
  Float64: Float64,
  PtzPreset: PtzPreset,
  nav_goal: nav_goal,
  alarm_srv: alarm_srv,
  temp_detection: temp_detection,
  Gas_alarm: Gas_alarm,
};
