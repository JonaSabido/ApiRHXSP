const SendSuccess = (response, statusCode, data, message) => {
    return response.status(statusCode).json(
        {
            success: true,
            data: data,
            message: message
        }
    )
}

const SendError = (response, statusCode, dataError, error) => {
    return response.status(statusCode).json(
        {
            success: false,
            data: dataError,
            message: error
        }
    )
}

module.exports = {
    SendSuccess,
    SendError,
}