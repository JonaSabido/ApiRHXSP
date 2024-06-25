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
        has_birth_certificate,
        has_identification,
        has_curp,
        has_nss,
        has_address_certification,
        has_studies_certification,
        has_tax_certificate,
        has_smn,
        has_no_criminal_certificate,
        has_health_certificate,
        has_sv,
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
        this.has_birth_certificate = has_birth_certificate;
        this.has_identification = has_identification;
        this.has_curp = has_curp;
        this.has_nss = has_nss;
        this.has_address_certification = has_address_certification;
        this.has_studies_certification = has_studies_certification;
        this.has_tax_certificate = has_tax_certificate;
        this.has_smn = has_smn;
        this.has_no_criminal_certificate = has_no_criminal_certificate;
        this.has_health_certificate = has_health_certificate;
        this.has_sv = has_sv;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.department = department;
        this.job = job;
        this.recruitment_method = recruitment_method;
    }
}

module.exports = Employee;
