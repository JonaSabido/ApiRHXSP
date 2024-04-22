class Employee {
    constructor(
        id,
        id_department,
        id_job,
        id_recruitment_method,
        code,
        name,
        sure_name,
        last_name,
        entry_date,
        gender,
        nss,
        rfc,
        curp,
        ssp,
        natal_date,
        email,
        phone,
        shirt_size,
        pants_size,
        shoe_size,
        has_children,
        address,
        cp,
        comments,
        status,
        createdAt,
        updatedAt,
        department,
        job,
        recruitment_method,
    ) {
        this.id = id;
        this.id_department = id_department;
        this.id_job = id_job;
        this.id_recruitment_method = id_recruitment_method;
        this.code = code;
        this.name = name;
        this.sure_name = sure_name;
        this.last_name = last_name;
        this.entry_date = entry_date;
        this.gender = gender;
        this.nss = nss;
        this.rfc = rfc;
        this.curp = curp;
        this.ssp = ssp;
        this.natal_date = natal_date;
        this.email = email;
        this.phone = phone;
        this.shirt_size = shirt_size;
        this.pants_size = pants_size;
        this.shoe_size = shoe_size;
        this.has_children = has_children;
        this.address = address;
        this.cp = cp;
        this.comments = comments;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.department = department;
        this.job = job;
        this.recruitment_method = recruitment_method;
    }
}

module.exports = Employee