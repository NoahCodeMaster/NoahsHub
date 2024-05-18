module.exports = async (req, res) => {
    try {
        const response = await fetch('https://glot.io/snippets/gw8jrmdycp/raw/main.js');
        const data = await response.text();
        res.status(200).send(data);
    } catch (error) {
        console.error('Error fetching key:', error);
        res.status(500).send('Error fetching key');
    }
};
