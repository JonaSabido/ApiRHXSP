const { dateFormatted } = require("../../../helpers/DateService");
const EmployeeFileNameResponseDTO = require("./EmployeeFileNameResponseDTO");

class EmployeeResponseDTO {
    constructor(
        employee
    ) {
        this.id = employee.id;
        this.id_department = employee.id_department;
        this.id_job = employee.id_job;
        this.id_recruitment_method = employee.id_recruitment_method;
        this.code = employee.code;
        this.full_name = `${employee.name} ${employee.sure_name} ${employee.last_name}`;
        this.name = employee.name;
        this.sure_name = employee.sure_name;
        this.last_name = employee.last_name;
        this.entry_date = employee.entry_date;
        this.entry_date_formatted = dateFormatted(employee.entry_date);
        this.entry_month = this.getMonth(parseInt(employee.entry_date?.slice(5, 7)))
        this.entry_year = employee.entry_date?.slice(0, 4)
        this.gender = employee.gender;
        this.nss = employee.nss;
        this.rfc = employee.rfc;
        this.curp = employee.curp;
        this.ssp = employee.ssp;
        this.natal_date = employee.natal_date;
        this.natal_date_formatted = dateFormatted(employee.natal_date);
        this.email = employee.email;
        this.phone = employee.phone;
        this.shirt_size = employee.shirt_size;
        this.pants_size = employee.pants_size;
        this.shoe_size = employee.shoe_size;
        this.has_children = employee.has_children;
        this.address = employee.address;
        this.cp = employee.cp;
        this.comments = employee.comments;
        this.status = employee.status;
        this.files = new EmployeeFileNameResponseDTO(employee.id)
        this.createdAt = employee.createdAt;
        this.updatedAt = employee.updatedAt;
        this.department = employee.department;
        this.job = employee.job;
        this.recruitment_method = employee.recruitment_method;

    }

    getMonth(number) {
        let month = '';
        switch (number) {
            case 1:
                month = 'Enero';
                break;
            case 2:
                month = 'Febrero';
                break;
            case 3:
                month = 'Marzo';
                break;
            case 4:
                month = 'Abril';
                break;
            case 5:
                month = 'Mayo';
                break;
            case 6:
                month = 'Junio';
                break;
            case 7:
                month = 'Julio';
                break;
            case 8:
                month = 'Agosto';
                break;
            case 9:
                month = 'Septiembre';
                break;
            case 10:
                month = 'Octubre';
                break;
            case 11:
                month = 'Noviembre';
                break;
            case 12:
                month = 'Diciembre';
                break;
        }
        return month;
    }
}

module.exports = EmployeeResponseDTO