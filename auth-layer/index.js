const express = require('express');
const bodyParser = require('body-parser');
const jsonRpcValidation = require('./middleware/jsonRpcValidation');
const { proxyRequest } = require('./services/apiProxy');

const app = express();
const PORT = 3000;

app.use(bodyParser.json());
app.use(jsonRpcValidation);

app.post('/', async (req, res) => {
    try {
        const response = await proxyRequest(req.body);
        res.json(response);
    } catch (error) {
        res.status(500).json({
            jsonrpc: "2.0",
            id: req.body.id,
            error: {
                code: -32603,
                message: "Internal error"
            }
        });
    }
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
