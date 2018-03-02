class HomeController < ApplicationController

  def index
    recipes = current_user.recipes
    ids = recipes.pluck(:id)
    @random_recipe = recipes.find(ids.sample) if ids.present?
    @last_seen_recipes = recipes.find(session[:recipe_history]).reverse! if session[:recipe_history].present?
    @recipes = recipes.last(3).reverse!
  end

end
