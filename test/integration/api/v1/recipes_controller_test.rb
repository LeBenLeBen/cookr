require 'test_helper'

module Api
  module V1
    class RecipesControllerTest < ActionDispatch::IntegrationTest
      test 'should list recipes' do
        recipe1 = recipes(:recipe_1)

        get api_v1_recipes_url
        assert_response :unauthorized

        user = users(:jessica)
        get api_v1_recipes_url, headers: auth_header(user)
        assert_response :success
        body = JSON.parse(response.body)
        assert_equal body['recipes'][0]['id'], recipe1.id
      end
    end
  end
end
