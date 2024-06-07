const express = require('express');
const { getAll, changeStatusById } = require('./NotificationUserController');

const api = express.Router();
const uri = '/notificationusers'

api.get(uri, getAll)
api.put(`${uri}/:id`, changeStatusById)


module.exports = api