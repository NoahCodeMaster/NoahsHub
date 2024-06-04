let keys = {};

module.exports = (req, res) => {
    const { hwid, key } = req.query;
    if (!hwid || !key) {
        return res.status(400).send('HWID and key are required');
    }

    const storedKey = keys[hwid];
    if (!storedKey) {
        return res.status(404).send('Key not found');
    }

    if (storedKey.key === key && storedKey.expiration > Date.now()) {
        res.json({ valid: true });
    } else {
        res.json({ valid: false });
    }
};
