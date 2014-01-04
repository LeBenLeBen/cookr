(function(jQuery) {

  /**
   * Enable Quicksearch of tags
   */
  jQuery('#tags_filter').quicksearch('.tag', {
    'noResults': '.tags-empty'
  });

})(jQuery);