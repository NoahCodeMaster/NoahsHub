import { useEffect, useState } from 'react';
import { useRouter } from 'next/router';

export default function KeyPage() {
  const router = useRouter();
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

    // Fetch key only if the referrer is from Linkvertise
    const referrer = document.referrer;
    const expectedIntermediateURL = 'https://linkvertise.com/1109446/mm2-key?o=sharing';
    if (referrer && referrer.includes(expectedIntermediateURL)) {
      fetchKey();
    } else {
      // Redirect if the referrer is not from Linkvertise
      router.replace('https://linkvertise.com/1109446/mm2-key?o=sharing');
    }
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
