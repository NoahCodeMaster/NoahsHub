import { useEffect } from 'react';
import { useRouter } from 'next/router';

export async function getServerSideProps(context) {
  // Perform referrer check here
  const referrer = context.req.headers.referer || context.req.headers.referrer;
  const expectedIntermediateURL = 'https://linkvertise.com/1109446/mm2-key?o=sharing';
  
  if (!referrer || !referrer.includes(expectedIntermediateURL)) {
    return {
      redirect: {
        destination: 'https://linkvertise.com/1109446/mm2-key?o=sharing',
        permanent: false,
      },
    };
  }

  // Optional: Add additional server-side logic here, such as loading the key
  const key = await fetchKeyFromServer();
  
  return {
    props: {
      key
    },
  };
}

// Optional: Fetch key from server
async function fetchKeyFromServer() {
  try {
    const response = await fetch('/api/getKey');
    const data = await response.json();
    return data.key;
  } catch (error) {
    console.error('Error fetching key:', error);
    return null;
  }
}

export default function KeyPage({ key }) {
  const router = useRouter();

  useEffect(() => {
    // Optional: Redirect if key is not available
    if (!key) {
      router.replace('https://linkvertise.com/1109446/mm2-key?o=sharing');
    }
  }, []);

  return (
    <div>
      {/* Optional: Display key */}
      {key && <p>Your Key: {key}</p>}
    </div>
  );
}
