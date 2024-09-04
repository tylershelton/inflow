import apiFetch from './apiFetch';
import auth from '../api/auth';

export async function getCollections () {
  const response = await apiFetch('/api/collections');

  if (response.ok) {
    const collections = await response.json();
    // populate each collection with its feeds/contents
    for (const i in collections) {
      const data = await apiFetch(`/api/collections/${collections[i].id}/contents`);
      collections[i].contents = await data.json();
    }
    return collections;
  }

  return [];
}
