const express = require('express');
const { getLeavesByMonth, getEntriesByMonth, getRecruitmentsByMonth, getValidationsByMonth, getActiveTimesByMonth, getTypeLeavesByMonth, getEventsByMonth, getTotalData } = require('./AnalyticController');

const api = express.Router();
const uri = '/analytics'

api.get(`${uri}/totaldata`, getTotalData)
api.get(`${uri}/eventsbymonth`, getEventsByMonth)
api.get(`${uri}/leavesbymonth`, getLeavesByMonth)
api.get(`${uri}/entriesbymonth`, getEntriesByMonth)
api.get(`${uri}/recruitmentsbymonth`, getRecruitmentsByMonth)
api.get(`${uri}/validationsbymonth`, getValidationsByMonth)
api.get(`${uri}/typeleavesbymonth`, getTypeLeavesByMonth)
api.get(`${uri}/activetimesbymonth`, getActiveTimesByMonth)



module.exports = api