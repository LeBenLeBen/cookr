module Api
  module V1
    class RecipesController < Api::V1::ApplicationController
      def index
        @recipes = paginate Recipe.where(recipe_params)
      end

      def show
        @recipe = Recipe.find(params[:id])
      end

      private

      def recipe_params
        params.permit(:user_id)
      end
    end
  end
end
