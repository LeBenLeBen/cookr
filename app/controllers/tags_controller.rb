class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes.alphabetically.page params[:page]
  end
end
