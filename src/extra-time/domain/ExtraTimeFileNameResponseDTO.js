const fs = require('fs');
const { SERVER_URL } = require('../../../config');

class ExtraTimeFileNameResponseDTO {
    constructor(idExtraTime) {
        this.evidence = this.checkFile(`uploads/extra-times/${idExtraTime}/evidence.pdf`);
    }

    checkFile(filePath) {
        try {
            return fs.existsSync(filePath) ? `${SERVER_URL}/${filePath}` : null;
        } catch (error) {
            return null;
        }
    }
}

module.exports = ExtraTimeFileNameResponseDTO