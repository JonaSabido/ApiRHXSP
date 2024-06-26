CREATE TABLE areas (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE jobs (
    id INT NOT NULL AUTO_INCREMENT,
    id_area INT NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_area) REFERENCES areas(id)
);

CREATE TABLE departments (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT,
    id_department INT NOT NULL,
    id_job INT NOT NULL,
    code INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    sure_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NULL,
    entry_date DATE NOT NULL,
    `status` BOOLEAN NOT NULL,
    gender VARCHAR(5) NOT NULL,
    nss VARCHAR(11) NOT NULL,
    rfc VARCHAR(13) NOT NULL,
    curp VARCHAR(18) NOT NULL,
    ssp BOOLEAN NOT NULL,
    natal_date DATE NOT NULL,
    email VARCHAR(255) NULL,
    phone VARCHAR(20) NULL,
    shirt_size VARCHAR(5) NULL,
    pants_size INT NULL,
    shoe_size INT NULL,
    has_children BOOLEAN NOT NULL,
    address VARCHAR(255) NULL,
    cp VARCHAR(5) NULL,
    qr_image MEDIUMTEXT NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_department) REFERENCES departments(id),
    FOREIGN KEY (id_job) REFERENCES jobs(id)
);

CREATE TABLE emergencies (
    id INT NOT NULL AUTO_INCREMENT,
    id_employee INT NOT NULL,
    reference_name VARCHAR(255) NOT NULL,
    type VARCHAR(30) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_employee) REFERENCES employees(id)
);

CREATE TABLE employee_contracts (
    id INT NOT NULL AUTO_INCREMENT,
    id_employee INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    `status` BOOLEAN NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(id_employee) REFERENCES employees(id)
);

CREATE TABLE employee_diseases (
    id INT NOT NULL AUTO_INCREMENT,
    id_employee INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_employee) REFERENCES employees(id)
);

CREATE TABLE type_absences (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE employee_absences (
    id INT NOT NULL AUTO_INCREMENT,
    id_type_absence INT NOT NULL,
    id_employee INT NOT NULL,
    id_job INT NOT NULL,
    `date` DATE NOT NULL,
    description VARCHAR(255) NOT NULL,
    path VARCHAR(200) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_type_absence) REFERENCES type_absences(id),
    FOREIGN KEY (id_employee) REFERENCES employees(id),
    FOREIGN KEY (id_job) REFERENCES jobs(id)
);

CREATE TABLE recommendations (
    id INT NOT NULL AUTO_INCREMENT,
    id_employee INT NOT NULL,
    id_recommended_employee INT NOT NULL,
    amount DECIMAL NOT NULL,
    first_payment_date DATE NOT NULL,
    second_payment_date DATE NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_employee) REFERENCES employees(id),
    FOREIGN KEY(id_recommended_employee) REFERENCES employees(id)
);

CREATE TABLE recommendation_payments (
    id INT NOT NULL AUTO_INCREMENT,
    id_recommendation INT NOT NULL,
    id_paying_employee INT NOT NULL,
    payment_date DATE NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_recommendation) REFERENCES recommendations(id),
    FOREIGN KEY(id_paying_employee) REFERENCES employees(id)
);

CREATE TABLE employee_reentries (
    id INT NOT NULL AUTO_INCREMENT,
    id_employee INT NOT NULL,
    reentry_date DATE NOT NULL,
    description VARCHAR(500) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_employee) REFERENCES employees(id)
);

CREATE TABLE vacation_times (
    id INT NOT NULL AUTO_INCREMENT,
    id_employee INT NOT NULL,
    start_date DATE NOT NULL,
    end_year DATE NOT NULL,
    days INT NOT NULL,
    available_days INT NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_employee) REFERENCES employees(id)
);

CREATE TABLE employee_vacations (
    id INT NOT NULL AUTO_INCREMENT,
    id_vacation_time INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    available_days INT NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_vacation_time) REFERENCES vacation_times(id)
);

CREATE TABLE employee_leaves (
    id INT NOT NULL AUTO_INCREMENT,
    id_employee INT NOT NULL,
    leave_date DATE NOT NULL,
    description VARCHAR(500) NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_employee) REFERENCES employees(id)
);

CREATE TABLE files (
    id INT NOT NULL AUTO_INCREMENT,
    id_employee INT NOT NULL,
    birth_certificate VARCHAR(200) NOT NULL,
    identification VARCHAR(200) NOT NULL,
    curp VARCHAR(200) NOT NULL,
    nss VARCHAR(200) NOT NULL,
    address_certification VARCHAR(200) NOT NULL,
    studies_certification VARCHAR(200) NULL,
    type_studies_certification VARCHAR(20) NULL,
    tax_certificate VARCHAR(200) NOT NULL,
    smn VARCHAR(200) NULL,
    no_criminal_certificate VARCHAR(200) NULL,
    health_certificate VARCHAR(200) NULL,
    sv VARCHAR(200) NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_employee) REFERENCES employees(id)
);

CREATE TABLE extra_times (
    id INT NOT NULL AUTO_INCREMENT,
    id_employee INT NOT NULL,
    path VARCHAR(200) NOT NULL,
    `date` DATE NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_employee) REFERENCES employees(id)
);

CREATE TABLE antidopings (
    id INT NOT NULL AUTO_INCREMENT,
    id_employee INT NOT NULL,
    photo MEDIUMTEXT NOT NULL,
    path VARCHAR(200) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_employee) REFERENCES employees(id)
);

CREATE TABLE trainings (
    id INT NOT NULL AUTO_INCREMENT,
    id_employee INT NOT NULL,
    path VARCHAR(200) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_employee) REFERENCES employees(id)
);

ALTER TABLE `jobs` ADD COLUMN name VARCHAR(100) NOT NULL AFTER id_area;

CREATE TABLE diseases (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(300) NOT NULL UNIQUE,
    password VARCHAR(300) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE recruitment_methods (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE employee_diseases DROP COLUMN name;
ALTER TABLE employee_diseases ADD COLUMN id_disease INT NOT NULL AFTER id_employee;
ALTER TABLE employee_diseases ADD FOREIGN KEY (id_disease) REFERENCES diseases(id);

RENAME TABLE employee_absences TO absences;
RENAME TABLE employee_contracts TO contracts;

ALTER TABLE recommendations drop column first_payment_date;
ALTER TABLE recommendations drop column second_payment_date;
ALTER TABLE recommendation_payments ADD COLUMN status INT NOT NULL AFTER payment_date;

ALTER TABLE employees drop column qr_image;

ALTER TABLE antidopings drop column photo;
ALTER TABLE antidopings drop column path;

ALTER TABLE trainings drop column path;

ALTER TABLE extra_times drop column path;

ALTER TABLE employees ADD COLUMN comments varchar(500) NULL AFTER cp;

ALTER TABLE employees ADD COLUMN id_recruitment_method INT NULL AFTER id_job;
ALTER TABLE employees ADD FOREIGN KEY (id_recruitment_method) REFERENCES recruitment_methods(id);


CREATE TABLE uniforms (
    id INT AUTO_INCREMENT NOT NULL,
    id_employee INT NOT NULL,
    type int NOT NULL,
    delivered_date date NOT NULL,
    comments varchar(255) NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(id_employee) REFERENCES employees(id)
);

ALTER TABLE absences DROP COLUMN path;

CREATE TABLE notification_types (
    id INT AUTO_INCREMENT NOT NULL,
    name varchar(50) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id)
);


INSERT INTO `notification_types` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Cumpleaños', NULL, NULL),
(2, 'Pago Recomendación', NULL, NULL),
(3, 'Finalización Contrato', NULL, NULL);

CREATE TABLE notifications (
    id INT AUTO_INCREMENT NOT NULL,
    id_notification_type INT NOT NULL,
    title varchar(100) NOT NULL,
    description varchar(255) NOT NULL,
    date DATE NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(id_notification_type) REFERENCES notification_types(id)
);

CREATE TABLE notification_users(
    id INT AUTO_INCREMENT NOT NULL,
    id_notification INT NOT NULL,
    id_user INT NOT NULL,
    `status` BOOLEAN NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(id_notification) REFERENCES notifications(id),
    FOREIGN KEY(id_user) REFERENCES users(id)
);
 
CREATE TABLE type_leaves(
    id INT AUTO_INCREMENT NOT NULL,
    name varchar(50) NOT NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

DELETE FROM employee_leaves;
ALTER TABLE employee_leaves ADD COLUMN id_type_leave INT NOT NULL;
ALTER TABLE employee_leaves ADD FOREIGN KEY (id_type_leave) REFERENCES type_leaves(id);

delete from contracts;
ALTER TABLE contracts ADD COLUMN type INT NOT NULL after id_employee;

ALTER TABLE employees ADD COLUMN has_birth_certificate BOOLEAN NOT NULL DEFAULT FALSE AFTER comments;
ALTER TABLE employees ADD COLUMN has_identification BOOLEAN NOT NULL DEFAULT FALSE AFTER has_birth_certificate;
ALTER TABLE employees ADD COLUMN has_curp BOOLEAN NOT NULL DEFAULT FALSE AFTER has_identification;
ALTER TABLE employees ADD COLUMN has_nss BOOLEAN NOT NULL DEFAULT FALSE AFTER has_curp;
ALTER TABLE employees ADD COLUMN has_address_certification BOOLEAN NOT NULL DEFAULT FALSE AFTER has_nss;
ALTER TABLE employees ADD COLUMN has_studies_certification BOOLEAN NOT NULL DEFAULT FALSE AFTER has_address_certification;
ALTER TABLE employees ADD COLUMN has_tax_certificate BOOLEAN NOT NULL DEFAULT FALSE AFTER has_studies_certification;
ALTER TABLE employees ADD COLUMN has_smn BOOLEAN NOT NULL DEFAULT FALSE AFTER has_tax_certificate;
ALTER TABLE employees ADD COLUMN has_no_criminal_certificate BOOLEAN NOT NULL DEFAULT FALSE AFTER has_smn;
ALTER TABLE employees ADD COLUMN has_health_certificate BOOLEAN NOT NULL DEFAULT FALSE AFTER has_no_criminal_certificate;
ALTER TABLE employees ADD COLUMN has_sv BOOLEAN NOT NULL DEFAULT FALSE AFTER has_health_certificate;
ALTER TABLE antidopings ADD COLUMN result VARCHAR(15) NOT NULL AFTER id_employee;
ALTER TABLE antidopings ADD COLUMN comments VARCHAR(500) NOT NULL AFTER result;



