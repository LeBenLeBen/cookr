class HomeController < ApplicationController

  def index
    ids = Recipe.pluck(:id)
    @random_recipe = Recipe.find(ids.sample)
    @recipes = Recipe.last(3)
  end

end
