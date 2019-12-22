require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test 'users can browse' do
    sign_in users(:mark)
    get :index
    assert_response :success
  end
end
