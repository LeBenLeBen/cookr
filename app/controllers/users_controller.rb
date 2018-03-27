class UsersController < ApplicationController

  def show
    @user = User.find_by!(username: params[:username])
    @title = @user === current_user ?
      t('nav.my_recipes') :
      helpers.possessive(@user.username.capitalize, t('activerecord.models.recipe.other'))
    @recipes = @user.recipes.alphabetically
  end

end
