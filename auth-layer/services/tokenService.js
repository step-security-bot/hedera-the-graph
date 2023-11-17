const db = require('../db');

async function isValidToken(token, method, params) {
    const { rows } = await db.query(
        "SELECT 1 FROM users WHERE token = $1 AND method = $2 AND param_name = $3",
        [token, method, params.name] // Assuming params has a 'name' attribute
    );
    
    return rows.length === 1;
}

module.exports = {
    isValidToken
};
