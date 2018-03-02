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
    get :show, params: { id: 1 }
    assert_response :success
  end

  test "author cannot see others’ recipe" do
    assert_raises(CanCan::AccessDenied) do
      sign_in users(:jessica)
      get :show, params: { id: 2 }
    end
  end
end
