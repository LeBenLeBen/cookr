module Api
  module V1
    class ApplicationController < ::ApplicationController
      include Rails::Pagination

      skip_before_action :authenticate_user!
      before_action :authenticate_user

      private

      def authenticate_user
        if request.headers['Authorization'].present?
          authenticate_or_request_with_http_token do |token|
            begin
              jwt_payload =
                JWT.decode(token, Rails.application.secrets.secret_key_base)
                  .first

              @current_user_id = jwt_payload['id']
            rescue JWT::ExpiredSignature,
                   JWT::VerificationError,
                   JWT::DecodeError
              head :unauthorized
            end
          end
        else
          render json: { error: 'API access unauthorized' },
                 status: :unauthorized
        end
      end
    end
  end
end
