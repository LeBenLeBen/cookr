(function(jQuery) {

  /**
   * Append a new ingredient line to the form
   */
  jQuery(document).on('click', '.add-ingredient', function(e) {
    var id = new Date().getTime();
    var tpl = jQuery(`<div class="recipe-ingredient row">
  <div class="col-xs-3">
    <input class="form-control recipe-amount-field" id="recipe_ingredients_attributes_${id}_amount" name="recipe[ingredients_attributes][${id}][amount]" size="30" type="text">
  </div>
  <div class="col-xs-9">
    <input class="form-control" id="recipe_ingredients_attributes_${id}_title" name="recipe[ingredients_attributes][${id}][title]" size="30" type="text">
  </div>
</div>`);

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
