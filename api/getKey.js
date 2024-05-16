import { useEffect } from 'react';
import { useRouter } from 'next/router';

export async function getServerSideProps(context) {
  // Perform referrer check here
  const referrer = context.req.headers.referer || context.req.headers.referrer;
  const expectedIntermediateURL = 'https://linkvertise.com/1109446/mm2-key?o=sharing';
  if (referrer !== expectedIntermediateURL) {
    return {
      redirect: {
        destination: 'https://linkvertise.com/1109446/mm2-key?o=sharing',
        permanent: false,
      },
    };
  }

  return {
    props: {},
  };
}

export default function KeyPage() {
  const router = useRouter();

  useEffect(() => {
    // No need to redirect on the client-side
  }, []);

  return null; // Render nothing on the page
}
