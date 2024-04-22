const fs = require('fs');
const { SERVER_URL } = require('../../../config');

class AntidopingFileNameResponseDTO {
    constructor(idAntidoping) {
        this.photo = this.checkFile(`uploads/antidopings/${idAntidoping}/photo.jpg`);
        this.evidence = this.checkFile(`uploads/antidopings/${idAntidoping}/evidence.pdf`);
    }

    checkFile(filePath) {
        try {
            return fs.existsSync(filePath) ? `${SERVER_URL}/${filePath}` : null;
        } catch (error) {
            return null;
        }
    }
}

module.exports = AntidopingFileNameResponseDTO