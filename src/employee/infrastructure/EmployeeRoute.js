const express = require('express');
const { getAll, getById, create, updateById, deleteById, saveFiles } = require('./EmployeeController');

const api = express.Router();
const uri = '/employees'

api.get(uri, getAll)
api.get(`${uri}/:id`, getById)
api.post(uri, create)
api.put(`${uri}/:id`, updateById)
api.delete(`${uri}/:id`, deleteById)
api.post(`${uri}/files/:id`, saveFiles)

module.exports = api