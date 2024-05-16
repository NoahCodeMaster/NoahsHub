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
    // Redirect on client-side if for some reason the server-side check fails
    router.replace('https://linkvertise.com/1109446/mm2-key?o=sharing');
  }, []);

  return null; // Render nothing on the page
}
