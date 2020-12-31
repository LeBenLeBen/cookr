module Api
  module V1
    class AuthController < Api::V1::ApplicationController
      skip_before_action :authenticate_user

      def token
        user = User.find_by_email(params[:email])

        if user && user.valid_password?(params[:password])
          @current_user = user
        else
          render json: { errors: { 'email or password' => ['is invalid'] } },
                 status: :unprocessable_entity
        end
      end
    end
  end
end
