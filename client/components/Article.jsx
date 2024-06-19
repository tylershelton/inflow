import React from 'react';

const Article = ({ title, description, pubdate, url }) => {
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
};

export default Article;
