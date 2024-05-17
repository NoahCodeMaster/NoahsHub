import { useEffect, useState } from 'react';

export default function KeyPage() {
  const [key, setKey] = useState(null);

  useEffect(() => {
    const fetchKey = async () => {
      try {
        const response = await fetch('https://glot.io/snippets/gw8jrmdycp/raw/main.js'); // Replace with your raw link
        if (!response.ok) {
          throw new Error('Failed to fetch key: ' + response.status);
        }
        const data = await response.text();
        // Parse the JavaScript file to extract the key (assuming it's in a specific format)
        const keyRegex = /const\s+correctKey\s+=\s+"([^"]+)"/;
        const match = data.match(keyRegex);
        if (match) {
          setKey(match[1]);
        } else {
          throw new Error('Key not found in the JavaScript file');
        }
      } catch (error) {
        console.error('Error fetching key:', error);
        setKey(null);
      }
    };

    fetchKey();
  }, []);

  return (
    <div>
      {/* Display key if available */}
      {key && <p>Your Key: {key}</p>}
      {/* Optional: Add loading indicator */}
      {!key && <p>Loading key...</p>}
    </div>
  );
}
