class IngredientsController < ApplicationController

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    render :json => {}
  end

end
