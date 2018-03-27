class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes.alphabetically
  end

  def index
    respond_to do |format|
      format.json do
        query = params[:q].downcase
        if query.present?
          render :json => Tag.where("lower(title) like ?", "%#{query}%")
        else
          render :json => Tag.all
        end
      end
    end
  end

end
