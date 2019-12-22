require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test 'anonymous should be redirected to login' do
    @controller = HomeController.new
    get :index
    assert_response :redirect
  end
end
