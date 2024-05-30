const express = require('express');
const { createAll } = require('./NotificationController');

const api = express.Router();
const uri = '/notifications'

api.post(uri, createAll)

module.exports = api