(function(jQuery) {

  jQuery('.recipe-ingredient').on('click', '.remove-button', function(e) {
    var wrapper = jQuery(this).closest('.recipe-ingredient'),
        id = wrapper.data('id');

    if (id) {
      jQuery.ajax({
        url: '/ingredients/' + id,
        type: 'DELETE',
        dataType: "json",
        complete: function() {
          wrapper.remove();
        }
      });
    }
    else {
      wrapper.remove();
    }
  });

  jQuery(document).on('click', '.add-ingredient', function(e) {
    var tpl = HandlebarsTemplates['recipe/ingredient']({
      id: new Date().getTime()
    });

    jQuery('.ingredients').append(tpl);
  });

})(jQuery);