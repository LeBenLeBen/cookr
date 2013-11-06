class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
