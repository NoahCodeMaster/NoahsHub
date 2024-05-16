import { promises as fs } from 'fs';
import path from 'path';

export default async function handler(req, res) {
    const referrer = req.headers.referer || req.headers.referrer;

    // Replace with your Linkvertise link or domain
    const allowedReferrer = 'https://direct-link.net/1109446/mm2-key';

    if (referrer && referrer.startsWith(allowedReferrer)) {
        try {
            const filePath = path.join(process.cwd(), 'key.txt');
            const key = await fs.readFile(filePath, 'utf8');
            res.status(200).json({ key: key.trim() });
        } catch (error) {
            res.status(500).json({ error: 'Failed to read key' });
        }
    } else {
        res.status(403).json({ error: 'Access denied' });
    }
}
