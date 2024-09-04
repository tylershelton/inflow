import React from 'react';
import BrowserItem from './BrowserItem';
import { Outlet, useFetcher, useLoaderData } from 'react-router-dom';
import apiFetch from '../api/apiFetch';

async function getCollection (id) {
  const data = await apiFetch(`/api/collections/${id}`);
  const collection = await data.json();
  collection.type = 'collection';
  return collection;
}

async function getFeed (id) {
  const data = await apiFetch(`/api/feeds/${id}`);
  const feed = await data.json();
  feed.type = 'feed';
  return feed;
}

async function getFeedItems (collection) {
  const data = await apiFetch(`/api/feeditems/${collection.type}/${collection.id}?all=false`);
  return await data.json();
}

export async function action ({ request }) {
  const formData = await request.formData();
  return await apiFetch('/api/' + formData.get('endpoint'));
}

export async function loader ({ request, params }) {
  const url = new URL(request.url);
  const entity = url.pathname.includes('collections')
    ? await getCollection(params.collectionId)
    : await getFeed(params.feedId);
  return { entity: entity, items: await getFeedItems(entity) };
}

export default function ItemBrowser () {
  const { entity, items } = useLoaderData();
  const fetcher = useFetcher();

  const syncing = fetcher.formData ? true : false;

  const feedItemComponents = items.map((item, i) => {
    return (<BrowserItem key={`browseritem-${i}`} entity={entity} item={item} />);
  });
  
  const apiEntity = entity.type === 'collection' ? 'collections' : 'feeds';
  
  return (
    <>
      <section className='itemBrowser'>
        <h2>{entity.title}</h2>
        <fetcher.Form method="post">
          <input type='hidden' name='endpoint' value={`/${apiEntity}/${entity.id}/sync`} />
          <button
            name="sync"
            value={syncing ? 'false' : 'true'}
          >
            {syncing ? 'Syncing...' : 'Sync'}
          </button>
        </fetcher.Form>
        {feedItemComponents}
      </section>
      <Outlet />
    </>
  );
}
