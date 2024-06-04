let keys = {};

module.exports = (req, res) => {
    const { hwid } = req.query;
    if (!hwid) {
        return res.status(400).send('HWID is required');
    }

    const storedKey = keys[hwid];
    if (!storedKey) {
        return res.status(404).send('Key not found');
    }

    res.json({ key: storedKey.key });
};
