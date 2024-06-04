module.exports = (req, res) => {
    const { hwid } = req.query;
    if (!hwid) {
        return res.status(400).send('HWID is required');
    }

    const storedKey = keys[hwid];
    if (storedKey && storedKey.expiration > Date.now()) {
        return res.json({ key: storedKey.key });
    }

    res.status(404).send('No valid key found');
};
