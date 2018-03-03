class HomeController < ApplicationController

  def index
    recipes = current_user.recipes
    ids = recipes.pluck(:id)
    @random_recipe = recipes.find(ids.sample) if ids.present?

    if session[:recipe_history]
      @last_seen_recipes = []
      session[:recipe_history].each do |r|
        recipe = recipes.find_by_id(r)
        if recipe.present?
          @last_seen_recipes << recipe
        end
      end
      @last_seen_recipes = @last_seen_recipes.reverse!
    end

    @recipes = recipes.last(3).reverse!
  end

end
