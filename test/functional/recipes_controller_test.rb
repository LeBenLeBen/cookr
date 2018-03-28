require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "user can create recipes" do
    sign_in users(:jessica)
    get :new
    assert_response :success
  end

  test "author can edit its recipes" do
    sign_in users(:jessica)
    get :edit, params: { id: users(:jessica).recipes.first.id }
    assert_response :success
  end

  test "author cannot edit others’ recipe" do
    assert_raises(CanCan::AccessDenied) do
      sign_in users(:jessica)
      get :edit, params: { id: users(:mark).recipes.first.id }
    end
  end

  test "author cannot delete others’ recipe" do
    assert_raises(CanCan::AccessDenied) do
      sign_in users(:jessica)
      delete :destroy, params: { id: users(:mark).recipes.first.id }
    end
  end
end
