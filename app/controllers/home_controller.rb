class HomeController < ApplicationController

  def index
    ids = Recipe.pluck(:id)
    @random_recipe = Recipe.find(ids.sample) if ids.present?
    @last_seen_recipes = Recipe.find(session[:recipe_history]) if session[:recipe_history].present?
    @recipes = Recipe.last(3).reverse!
  end

end
