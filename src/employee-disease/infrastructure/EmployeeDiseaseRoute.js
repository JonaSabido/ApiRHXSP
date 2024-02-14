const express = require('express');
const { getAll, getById, create, updateById, deleteById } = require('./EmployeeDiseaseController');

const api = express.Router();
const uri = '/employeediseases'

api.get(uri, getAll)
api.get(`${uri}/:id`, getById)
api.post(uri, create)
api.delete(`${uri}/:id`, deleteById)

module.exports = api