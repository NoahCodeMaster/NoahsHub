import { useEffect, useState } from 'react';

export default function KeyPage() {
  const [key, setKey] = useState(null);

  useEffect(() => {
    const fetchKey = async () => {
      try {
        const response = await fetch('/key.txt'); // Fetch key from 'key.txt' file
        const data = await response.text(); // Read the text content of the file
        setKey(data.trim()); // Remove leading/trailing whitespace and set the key
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
