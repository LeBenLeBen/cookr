class RecipesController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  after_action :store_history, :only => [:show]

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.alphabetically
    @tags = Tag.order(:title)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    unless @recipe.ingredients.present?
      @recipe.ingredients.build
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end


  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      :steps,
      :time,
      :notes,
      :quantity,
      :ingredients_attributes,
      :tag_list,
      :tag_count,
      :image,
      :asset_file_name,
      :ingredients_attributes => [
        :id,
        :amount,
        :title
      ],
      :tags_attributes => [
        :title
      ])
  end

  def store_history
    session[:recipe_history] ||= []
    session[:recipe_history].delete_at(0) if session[:recipe_history].size >= 3
    session[:recipe_history] << @recipe.id
  end

end
