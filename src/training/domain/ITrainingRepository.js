class ITrainingRepository {
  async getAll(filters) {
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

  async destroyFilesById(id){
    throw new Error('Method not implemented');
  }
}

module.exports = ITrainingRepository;