class UsersController < ApplicationController
  def show
    @user = User.find_by!(username: params[:username])
    @title =
      if @user === current_user
        t('nav.my_recipes')
      else
        helpers.possessive(
          @user.username.capitalize,
          t('activerecord.models.recipe.other')
        )
      end
    @recipes = @user.recipes.alphabetically
  end
end
