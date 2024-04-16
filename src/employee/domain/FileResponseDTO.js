const fs = require('fs');

class FileNameResponseDTO {
    constructor(idEmployee) {
        this.birth_certificate = this.checkFile(`uploads/employees/${idEmployee}/birth_certificate.pdf`);
        this.identification = this.checkFile(`uploads/employees/${idEmployee}/identification.pdf`);
        this.curp = this.checkFile(`uploads/employees/${idEmployee}/curp.pdf`);
        this.nss = this.checkFile(`uploads/employees/${idEmployee}/nss.pdf`);
        this.address_certification = this.checkFile(`uploads/employees/${idEmployee}/address_certification.pdf`);
        this.studies_certification = this.checkFile(`uploads/employees/${idEmployee}/studies_certification.pdf`);
        this.tax_certificate = this.checkFile(`uploads/employees/${idEmployee}/tax_certificate.pdf`);
        this.smn = this.checkFile(`uploads/employees/${idEmployee}/smn.pdf`);
        this.no_criminal_certificate = this.checkFile(`uploads/employees/${idEmployee}/no_criminal_certificate.pdf`);
        this.health_certificate = this.checkFile(`uploads/employees/${idEmployee}/health_certificate.pdf`);
        this.sv = this.checkFile(`uploads/employees/${idEmployee}/sv.pdf`);
        this.employee_image = this.checkFile(`uploads/employees/${idEmployee}/employee_image.jpg`);
        this.qr_image = this.checkFile(`uploads/employees/${idEmployee}/qr_image.jpg`);
    }

    checkFile(filePath) {
        try {
            return fs.existsSync(filePath) ? `http://localhost:3000/${filePath}` : null;
        } catch (error) {
            return null;
        }
    }
}

module.exports = FileNameResponseDTO