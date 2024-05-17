import { useEffect, useState } from 'react';

export default function KeyPage() {
  const [key, setKey] = useState(null);

  useEffect(() => {
    const fetchKey = async () => {
      try {
        const response = await fetch('/key.txt');
        console.log('Response status:', response.status);
        const data = await response.text();
        console.log('Key data:', data);
        setKey(data.trim());
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
