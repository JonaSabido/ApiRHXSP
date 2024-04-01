class AuthService {
    constructor(
        iUserRepository
    ) {
        this.iUserRepository = iUserRepository
    }

    async existsUser(email, password) {
        const filters = { email: email, password: password }
        const attributes = ['id', 'name', 'email']
        return this.iUserRepository.getByFilters(filters, attributes)
    }
}

module.exports = AuthService
