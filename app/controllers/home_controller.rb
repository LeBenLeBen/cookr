class HomeController < ApplicationController

  def index
    ids = Recipe.pluck(:id)
    if ids.present?
      @random_recipe = Recipe.find(ids.sample)
    end

    @recipes = Recipe.last(3)
  end

end
