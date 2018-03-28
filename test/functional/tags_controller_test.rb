require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "users can view recipes by tags" do
    sign_in users(:jessica)
    get :show, params: { id: tags(:tag_1).id }
    assert_response :success
  end
end
