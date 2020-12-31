require 'test_helper'

module Api
  module V1
    class AuthControllerTest < ActionDispatch::IntegrationTest
      test 'should return token' do
        post api_v1_auth_token_url
        assert_response :unprocessable_entity

        user = users(:jessica)
        post api_v1_auth_token_url,
             params: { email: user.email, password: 'whatever' }
        assert_response :unprocessable_entity

        post api_v1_auth_token_url,
             params: { email: user.email, password: '123456' }
        assert_response :success
        body = JSON.parse(response.body)
        assert_not_nil body['user']['token']
      end
    end
  end
end
