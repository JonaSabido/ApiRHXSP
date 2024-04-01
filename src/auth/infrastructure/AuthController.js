const { SendSuccessData, SendErrorData, SendSuccessAuth, SendErrorAuth } = require('../../../helpers/ApiResponse');
const AuthService = require('../application/AuthService');
const UserRepository = require('../../user/infrastructure/UserRepository');
const jwt = require('jsonwebtoken');
const { SECRET_KEY } = require('../../../config');


const userRepository = new UserRepository();
const authService = new AuthService(userRepository)

const login = async (request, response) => {
    try {
        const authUser = await authService.existsUser(request.body.email, request.body.password)
        if (authUser) {
            const token = jwt.sign({ authUser }, SECRET_KEY, { expiresIn: '24h' })
            return SendSuccessAuth(response, token)
        }
        return SendErrorAuth(response)
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)
    }

}

module.exports = {
    login
}