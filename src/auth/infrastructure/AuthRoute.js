const express = require('express');
const { login, } = require('./AuthController');

const api = express.Router();
const uri = '/auth'

api.post(`${uri}/login`, login)

module.exports = api