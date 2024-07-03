import React from 'react';
import { useLoaderData, useMatch } from 'react-router-dom';

export async function loader ({ request }) {
  const url = new URL(request.url);
  return await fetch(url);
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
