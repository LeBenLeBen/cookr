class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(params[:recipe])

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
    @recipes = Recipe.all
  end

  def edit
    @recipe = Recipe.find(params[:id])

    # logger.debug "****************************************************************"
    # logger.debug @recipe.inspect
    # logger.debug @recipe.ingredients.inspect
    # logger.debug "****************************************************************"
  end

  def update
    @recipe = Recipe.find(params[:id])

    # logger.debug "****************************************************************"
    # logger.debug @recipe.attributes.inspect
    # logger.debug "****************************************************************"
    # logger.debug params[:recipe]
    # logger.debug "****************************************************************"

    if @recipe.update_attributes(params[:recipe])
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

end
