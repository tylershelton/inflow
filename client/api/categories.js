import apiFetch from './apiFetch';
import auth from '../api/auth';

export async function getCategories () {
  const response = await apiFetch('/api/categories');

  if (response.ok) {
    const categories = await response.json();
    // populate each category with its feeds/contents
    for (const i in categories) {
      const data = await apiFetch(`/api/categories/${categories[i].id}/contents`);
      categories[i].contents = await data.json();
    }
    return categories;
  }

  return [];
}
