const express = require('express');
const { getAll, getById, create, updateById, deleteById, getDaysByVacationTimeId } = require('./EmployeeVacationController');

const api = express.Router();
const uri = '/employeevacations'

api.get(uri, getAll)
api.get(`${uri}/vacationtime/:id`, getDaysByVacationTimeId)
api.get(`${uri}/:id`, getById)
api.post(uri, create)
api.put(`${uri}/:id`, updateById)
api.delete(`${uri}/:id`, deleteById)

module.exports = api