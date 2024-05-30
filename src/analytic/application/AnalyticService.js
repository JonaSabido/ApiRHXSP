
class AnalyticService {
    constructor(
        iAnalyticRepository
    ) {
        this.iAnalyticRepository = iAnalyticRepository
    }

    async getLeavesByMonth(month, year) {
        return await this.iAnalyticRepository.getLeavesByMonth(month, year);
    }

    async getEntriesByMonth(month, year) {
        return await this.iAnalyticRepository.getEntriesByMonth(month, year);
    }

    async getRecruitmentsByMonth(month, year) {
        return await this.iAnalyticRepository.getRecruitmentsByMonth(month, year);
    }

    async getValidationsByMonth(month, year) {
        return await this.iAnalyticRepository.getValidationsByMonth(month, year);
    }

    async getActiveTimesByMonth(month, year) {
        return await this.iAnalyticRepository.getActiveTimesByMonth(month, year);
    }

}

module.exports = AnalyticService