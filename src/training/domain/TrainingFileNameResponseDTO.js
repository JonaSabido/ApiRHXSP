const fs = require('fs');
const { SERVER_URL } = require('../../../config');

class TrainingFileNameResponseDTO {
    constructor(idTraining) {
        this.evidence = this.checkFile(`uploads/trainings/${idTraining}/evidence.pdf`);
    }

    checkFile(filePath) {
        try {
            return fs.existsSync(filePath) ? `${SERVER_URL}/${filePath}` : null;
        } catch (error) {
            return null;
        }
    }
}

module.exports = TrainingFileNameResponseDTO