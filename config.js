const PORT = process.env.PORT || 3000

const DB_HOST = process.env.DB_HOST || 'localhost'

const SERVER_URL = process.env.SERVER_URL || 'http://localhost:3000'

const DB_USER = process.env.DB_USER || 'root'

const DB_PASSWORD = process.env.DB_PASSWORD || ''

const DB_NAME = process.env.DB_NAME || 'rhxsp_prod'

const SECRET_KEY = process.env.SECRET_KEY || 'adjkoasdjsd'

module.exports = { PORT, DB_HOST, SERVER_URL, DB_USER, DB_PASSWORD, DB_NAME, SECRET_KEY };