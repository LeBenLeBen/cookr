class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes.alphabetically
  end

  def index
    @tags = Tag.order(:title)
  end

end
