require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test 'author can see its profile' do
    sign_in users(:jessica)
    get :show, params: { username: users(:jessica).username }
    assert_response :success
  end

  test 'user can see others’ profile' do
    sign_in users(:jessica)
    get :show, params: { username: users(:mark).username }
    assert_response :success
  end
end
