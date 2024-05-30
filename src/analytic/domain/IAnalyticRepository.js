class IAnalyticRepository {
  async getLeavesByMonth(month, year) {
    throw new Error('Method not implemented');
  }

  async getEntriesByMonth(month, year) {
    throw new Error('Method not implemented');
  }

  async getRecruitmentsByMonth(month, year) {
    throw new Error('Method not implemented');
  }

  async getValidationsByMonth(month, year) {
    throw new Error('Method not implemented');
  }

  async getActiveTimesByMonth(month, year) {
    throw new Error('Method not implemented');
  }
}

module.exports = IAnalyticRepository;