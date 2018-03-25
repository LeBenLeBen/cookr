document.addEventListener('DOMContentLoaded', function() {

  /**
   * Append a new ingredient line to the form
   */
  const addIngredientBtn = document.querySelector('.recipe-add-ingredient-btn');

  if (addIngredientBtn) {
    addIngredientBtn.addEventListener('click', function(e) {
      const id = new Date().getTime();
      const row = document.createElement('div');
      row.classList.add('grid', 'grid--small', 'form-group');
      const tpl = `<div class="grid__item w-1/4">
  <input class="field" id="recipe_ingredients_attributes_${id}_amount" name="recipe[ingredients_attributes][${id}][amount]" type="text">
</div>
<div class="grid__item w-3/4">
  <input class="field" id="recipe_ingredients_attributes_${id}_title" name="recipe[ingredients_attributes][${id}][title]" type="text">
</div>`;
      row.innerHTML = tpl;

      const wrapper = document.querySelector('.recipe-ingredients')
      wrapper.insertBefore(row, addIngredientBtn);
      row.querySelector('input').focus();
    });
  }

});
