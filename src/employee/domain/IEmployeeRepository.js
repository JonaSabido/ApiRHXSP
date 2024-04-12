class IEmployeeRepository {
  async getAll() {
    throw new Error('Method not implemented');
  }

  async getById(id) {
    throw new Error('Method not implemented');
  }

  async create(data) {
    throw new Error('Method not implemented');
  }

  async update(id, data) {
    throw new Error('Method not implemented');
  }

  async delete(id) {
    throw new Error('Method not implemented');
  }

  async changeStatus(id, status) {
    throw new Error('Method not implemented');
  }

  async saveFiles(id, files) {
    throw new Error('Method not implemented');
  }
}

module.exports = IEmployeeRepository;