import Choices from 'choices.js';

document.addEventListener('DOMContentLoaded', function() {

  const el = document.querySelector('[data-typeahead="tags"]');

  if (!el) {
    return
  }

  const choices = new Choices(el);

});
