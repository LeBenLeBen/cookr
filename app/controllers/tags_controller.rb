class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes.alphabetically
    @tags = Tag.order(:title)
  end

  def index
    respond_to do |format|
      format.json do
        query = params[:q]
        if query.present?
          render :json => Tag.where("title like ?", "%#{query}%")
        else
          render :json => Tag.all
        end
      end
    end
  end

end
