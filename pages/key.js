import { useEffect, useState } from 'react';

export default function KeyPage() {
  const [key, setKey] = useState(null);

  useEffect(() => {
    const fetchKey = async () => {
      try {
        const response = await fetch('/api/getKey');
        if (!response.ok) {
          throw new Error('Failed to fetch key: ' + response.status);
        }
        const data = await response.json();
        setKey(data.key);
      } catch (error) {
        console.error('Error fetching key:', error);
        setKey(null);
      }
    };

    fetchKey();
  }, []);

  const copyToClipboard = () => {
    if (key) {
      navigator.clipboard.writeText(key)
        .then(() => alert('Key copied to clipboard'))
        .catch((error) => console.error('Error copying key:', error));
    }
  };

  return (
    <div className="container">
      {key ? <p>Your Key: {key}</p> : <p>Loading key...</p>}
      {key && <button onClick={copyToClipboard}>Copy Key</button>}
      <style jsx>{`
        .container {
          font-family: Arial, sans-serif;
          background-color: #f0f0f0;
          margin: 0;
          padding: 0;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
          height: 100vh;
          background-color: #f0f0f0;
          border-radius: 8px;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          text-align: center;
          padding: 20px;
        }
        p {
          font-size: 18px;
          margin-bottom: 20px;
        }
        button {
          padding: 10px 20px;
          background-color: #007bff;
          color: #fff;
          border: none;
          border-radius: 5px;
          cursor: pointer;
          transition: background-color 0.3s;
        }
        button:hover {
          background-color: #0056b3;
        }
      `}</style>
    </div>
  );
}
