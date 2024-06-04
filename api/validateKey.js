module.exports = (req, res) => {
    const { hwid, key } = req.query;
    if (!hwid || !key) {
        return res.status(400).send('HWID and key are required');
    }

    const storedKey = keys[hwid];
    if (storedKey && storedKey.key === key && storedKey.expiration > Date.now()) {
        return res.json({ valid: true });
    }

    res.json({ valid: false });
};
