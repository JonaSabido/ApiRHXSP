const express = require('express');
const { getAll, getById} = require('./TypeAbsenceController');

const api = express.Router();
const uri = '/typeabsences'

api.get(uri, getAll)
api.get(`${uri}/:id`, getById)

module.exports = api