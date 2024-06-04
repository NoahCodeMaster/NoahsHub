let keys = {};

module.exports = (req, res) => {
    const { hwid } = req.query;
    if (!hwid) {
        return res.status(400).send('HWID is required');
    }

    delete keys[hwid];

    res.json({ success: true });
};
