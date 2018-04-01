// SVG icons sprite
import './icons';

// Enable search
import search from 'components/search';

const searchContainer = document.querySelector('#search-container');
if (searchContainer) {
  new search({
    el: searchContainer
  });
}
