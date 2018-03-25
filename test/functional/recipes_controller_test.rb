require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "anonymous should be redirected to login" do
    get :index
    assert_response :redirect
  end

  test "author can see its recipes index" do
    sign_in users(:jessica)
    get :index
    assert_response :success
  end

  test "author can see its recipe" do
    sign_in users(:jessica)
    get :show, params: { id: users(:jessica).recipes.first.id }
    assert_response :success
  end

  test "user can see others’ recipes" do
    sign_in users(:jessica)
    get :show, params: { id: users(:mark).recipes.first.id }
    assert_response :success
  end

  test "author cannot edit others’ recipe" do
    assert_raises(CanCan::AccessDenied) do
      sign_in users(:jessica)
      get :edit, params: { id: users(:mark).recipes.first.id }
    end
  end
end
