(function(jQuery) {

  /**
   * Change simple divisions (1/2, 1/3, …) to their UTF-8 equivalent
   */
  jQuery(document).on('keyup', '.recipe-amount-field', function(e) {
    var val = jQuery(this).val(),
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
      jQuery(this).val(replacement);
    }
  });

})(jQuery);