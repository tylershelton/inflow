import React from 'react';
import { useLoaderData } from 'react-router-dom';

import apiFetch from '../api/apiFetch';

export async function loader ({ request }) {
  const url = new URL('api/' + request.url);
  return await apiFetch(url);
}

export default function Article () {
  const { title, pubdate, description } = useLoaderData();

  return (
    <section className='article'>
      <article>
        <h1>{title}</h1>
        <time dateTime={pubdate}>{new Date(pubdate).toDateString()}</time>
        <section className='article-body'>
          {description}
        </section>
      </article>
    </section>
  );
}
