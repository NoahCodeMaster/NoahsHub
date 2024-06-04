const { v4: uuidv4 } = require('uuid');

let keys = {};

module.exports = (req, res) => {
    const { hwid } = req.query;
    if (!hwid) {
        return res.status(400).send('HWID is required');
    }

    const key = uuidv4().replace(/-/g, '').substring(0, 16); // Generate a 16-char hex key
    const expiration = Date.now() + 24 * 60 * 60 * 1000; // 24 hours in milliseconds

    keys[hwid] = { key, expiration };

    res.json({ key, expiration });
};
