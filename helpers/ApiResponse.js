const SendSuccessData = (response, statusCode, data, message) => {
    return response.status(statusCode).json(
        {
            success: true,
            data: data,
            message: message
        }
    )
}

const SendSuccessAuth = (response, token) => {
    return response.status(201).json(
        {
            token: token,
            message: 'Authentication Succesful'
        }
    )
}

const SendErrorData = (response, statusCode, dataError, error) => {
    return response.status(statusCode).json(
        {
            success: false,
            data: dataError,
            message: error
        }
    )
}

const SendErrorAuth = (response) => {
    return response.status(401).json(
        {
            message: 'Unauthorized'
        }
    )
}

module.exports = {
    SendSuccessData,
    SendSuccessAuth,
    SendErrorData,
    SendErrorAuth,
}