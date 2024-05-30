const express = require('express');
const { getLeavesByMonth, getEntriesByMonth, getRecruitmentsByMonth, getValidationsByMonth, getActiveTimesByMonth } = require('./AnalyticController');

const api = express.Router();
const uri = '/analytics'

api.get(`${uri}/leavesbymonth`, getLeavesByMonth)
api.get(`${uri}/entriesbymonth`, getEntriesByMonth)
api.get(`${uri}/recruitmentsbymonth`, getRecruitmentsByMonth)
api.get(`${uri}/validationsbymonth`, getValidationsByMonth)
api.get(`${uri}/activetimesbymonth`, getActiveTimesByMonth)



module.exports = api