document.addEventListener('DOMContentLoaded', function() {

  /**
   * Change simple divisions (1/2, 1/3, …) to their UTF-8 equivalent
   */
  document.addEventListener('keyup', function(e) {
    if (!e.target.matches('.recipe-amount-field')) {
      return;
    }

    var val = e.target.value,
        replacement = '';

    switch(val) {
      case '1/2':
        replacement = '½';
        break;
      case '1/3':
        replacement = '⅓';
        break;
      case '2/3':
        replacement = '⅔';
        break;
      case '1/4':
        replacement = '¼';
        break;
      case '3/4':
        replacement = '¾';
        break;
    }

    if (replacement) {
      e.target.value = replacement;
    }
  });

});
