const { isValidToken } = require('../services/tokenService');

async function jsonRpcValidation(req, res, next) {
    const { id, method, params } = req.body;
    const token = req.headers['authorization'];
    
    if (!(await isValidToken(token, method, params))) {
        return res.status(401).json({
            jsonrpc: "2.0",
            id,
            error: {
                code: -32600,
                message: "Unauthorized"
            }
        });
    }

    next();
}

module.exports = jsonRpcValidation;
