const axios = require('axios');

const API_ENDPOINT = 'http://your_jsonrpc_api_endpoint';

async function proxyRequest(body) {
    const response = await axios.post(API_ENDPOINT, body, {
        headers: {
            'Content-Type': 'application/json'
        }
    });
    return response.data;
}

module.exports = {
    proxyRequest
};
