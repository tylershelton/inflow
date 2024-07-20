export async function getCategories () {
  const response = await fetch('/categories');

  if (response.ok) {
    const categories = await response.json();
    // populate each category with its feeds/contents
    for (const i in categories) {
      const data = await fetch(`/categories/${categories[i].id}/contents`);
      categories[i].contents = await data.json();
    }
    return categories;
  }

  return [];
}
