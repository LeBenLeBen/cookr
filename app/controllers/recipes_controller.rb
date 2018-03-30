class RecipesController < ApplicationController

  after_action :store_history, :only => [:show]

  load_and_authorize_resource

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
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

    redirect_to root_path, :flash => { :notice => I18n.t('recipes.deleted') }
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
      :tag_count,
      :image,
      :asset_file_name,
      :ingredients_attributes => [
        :id,
        :amount,
        :title,
        :_destroy
      ],
      :tag_ids => []
    )
  end

  def store_history
    if @recipe.present?
      session[:recipe_history] ||= []
      session[:recipe_history] -= [@recipe.id] if session[:recipe_history].include? @recipe.id
      session[:recipe_history].delete_at(0) if session[:recipe_history].size >= 3
      session[:recipe_history] << @recipe.id
    end
  end

end
