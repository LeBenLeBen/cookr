(function(jQuery) {

  /**
   * Enable Quicksearch of tags
   */
  jQuery('#tags_filter').quicksearch('.tag', {
    'noResults': '.tags-empty'
  });

  /**
   * Typeahead tags
   */
  var engine = new Bloodhound({
    name: 'tags',
    remote: '/tags.json?q=%QUERY',
    datumTokenizer: function(d) {
      return Bloodhound.tokenizers.whitespace(d.val);
    },
    queryTokenizer: Bloodhound.tokenizers.whitespace
  });

  engine.initialize();

  jQuery('[data-typeahead="tags"]').tokenfield({
    createTokensOnBlur: true,
    typeahead: {
      displayKey: 'title',
      highlight: true,
      source: engine.ttAdapter()
    }
  });

})(jQuery);