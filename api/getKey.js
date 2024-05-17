import { useEffect, useState } from 'react';

export default function KeyPage() {
  const [key, setKey] = useState(null);

  useEffect(() => {
    const fetchKey = async () => {
      try {
        const response = await fetch('/api/getKey');
        const data = await response.json();
        setKey(data.key);
      } catch (error) {
        console.error('Error fetching key:', error);
        setKey(null);
      }
    };

    // Fetch key only when the component mounts
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
