(function(jQuery) {

  jQuery(document).on('click', '.add-ingredient', function(e) {
    var tpl = jQuery(HandlebarsTemplates['recipe/ingredient']({
      id: new Date().getTime()
    }));

    jQuery('.ingredients').append(tpl);
    tpl.find('input:first').focus();
  });

})(jQuery);