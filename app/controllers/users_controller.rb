class UsersController < ApplicationController

  def show
    @user = User.find_by!(username: params[:username])
    @recipes = @user.recipes.alphabetically
  end

end
