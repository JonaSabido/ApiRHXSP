const express = require('express');
const { getAll, getById, create, updateById, deleteById } = require('./AbsenceController');

const api = express.Router();
const uri = '/absences'

api.get(uri, getAll)
api.get(`${uri}/:id`, getById)
api.post(uri, create)
api.put(`${uri}/:id`, updateById)
api.delete(`${uri}/:id`, deleteById)

module.exports = api