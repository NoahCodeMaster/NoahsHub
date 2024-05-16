import { promises as fs } from 'fs';
import path from 'path';

export default async function handler(req, res) {
    try {
        const referrer = req.headers.referer || req.headers.referrer;
        const expectedIntermediateURL = 'https://linkvertise.com/1109446/mm2-key?o=sharing'; // Replace with your Linkvertise URL
        const allowedOrigins = ['https://venture-hub.vercel.app', 'https://www.venture-hub.vercel.app']; // Add your website domains

        // Check if the request is coming from your website or the expected intermediate URL
        if (referrer && (referrer === expectedIntermediateURL || allowedOrigins.some(origin => referrer.startsWith(origin)))) {
            const filePath = path.join(process.cwd(), 'key.txt');
            const key = await fs.readFile(filePath, 'utf8');
            res.status(200).json({ key: key.trim() });
        } else {
            res.status(403).json({ error: 'Access denied' });
        }
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}
