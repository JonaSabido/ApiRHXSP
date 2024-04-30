const fs = require('fs');
const { SERVER_URL } = require('../../../config');

class ContractFileNameResponseDTO {
    constructor(idContract) {
        this.evidence = this.checkFile(`uploads/contracts/${idContract}/evidence.pdf`);
    }

    checkFile(filePath) {
        try {
            return fs.existsSync(filePath) ? `${SERVER_URL}/${filePath}` : null;
        } catch (error) {
            return null;
        }
    }
}

module.exports = ContractFileNameResponseDTO