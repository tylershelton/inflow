import React from 'react';
import { useLoaderData, useMatch } from 'react-router-dom';

export async function loader ({ request }) {
  console.log('fetching:', request.url);
  const url = new URL(request.url);
  return await fetch(url);
}

export default function Article ({ title, description, pubdate, url }) {
  const article = useLoaderData();
  console.log(article);
  const match = useMatch();
  console.log(match);
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
