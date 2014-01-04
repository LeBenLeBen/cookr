(function(jQuery) {

  /**
   * Append a new ingredient line to the form
   */
  jQuery(document).on('click', '.add-ingredient', function(e) {
    var tpl = jQuery(HandlebarsTemplates['recipe/ingredient']({
      id: new Date().getTime()
    }));

    jQuery('.ingredients').append(tpl);
    tpl.find('input:first').focus();
  });

  /**
   * Enable Quicksearch of recipes
   */
  jQuery('#recipes_filter').quicksearch('.recipe', {
    'noResults': '.recipes-empty',
    'show': function() {
      var $this = jQuery(this);
      $this.removeClass('hidden').closest('.recipes-group').removeClass('hidden');
    },
    'hide': function() {
      var $this = jQuery(this);
      $this.addClass('hidden');

      if ($this.siblings('.recipe:not(.hidden)').length === 0) {
        $this.closest('.recipes-group').addClass('hidden');
      }
    }
  });

})(jQuery);