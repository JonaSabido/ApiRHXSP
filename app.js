const express = require('express');
const app = express();
const cors = require('cors');
const { PORT } = require('./config');
const areaRoute = require('./src/area/infrastructure/AreaRoute')
const jobRoute = require('./src/job/infrastructure/JobRoute')
const departmentRoute = require('./src/department/infrastructure/DepartmentRoute')
const employeeRoute = require('./src/employee/infrastructure/EmployeeRoute')
const emergencieRoute = require('./src/emergencie/infrastructure/EmergencieRoute')
const contractRoute = require('./src/contract/infrastructure/ContractRoute')
const employeeDiseasetRoute = require('./src/employee-disease/infrastructure/EmployeeDiseaseRoute')
const typeAbsenceRoute = require('./src/type-absence/infrastructure/TypeAbsenceRoute')
const absenceRoute = require('./src/absence/infrastructure/AbsenceRoute')
const diseaseRoute = require('./src/disease/infrastructure/DiseaseRoute')

app.use(cors());
app.use(express.json({ limit: '10mb' }))

app.use('/api', areaRoute, jobRoute, departmentRoute, employeeRoute, emergencieRoute, contractRoute, diseaseRoute, employeeDiseasetRoute, typeAbsenceRoute,



absenceRoute)

app.listen(PORT, () => {
    console.log('Servidor escuchando en el puerto ' + PORT);
});