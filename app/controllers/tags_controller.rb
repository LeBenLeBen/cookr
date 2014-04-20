class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes.alphabetically
  end

  def index
    respond_to do |format|
      format.html do
        @tags = Tag.order(:title)
      end
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
