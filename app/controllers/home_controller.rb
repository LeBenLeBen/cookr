class HomeController < ApplicationController
  def index
    @random_recipe = Recipe.order('RANDOM()').first
    @recipes = Recipe.last(5).reverse!
    @tags = Tag.all.order(:recipe_count).reverse

    if session[:recipe_history]
      @last_seen_recipes = []
      session[:recipe_history].each do |r|
        recipe = Recipe.find_by_id(r)
        @last_seen_recipes << recipe if recipe.present?
      end
      @last_seen_recipes = @last_seen_recipes.reverse!
    end
  end
end
