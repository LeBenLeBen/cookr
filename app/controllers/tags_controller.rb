class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes.alphabetically
  end

end
