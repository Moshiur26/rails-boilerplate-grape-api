# frozen_string_literal: true

module UserPanel
  module V1
    class Users < UserPanel::Base
      resource '/' do
        params do
          requires :username, type: String
          requires :password, type: String
        end

        desc 'User Login'
        route_setting :authentication, optional: true

        post 'login' do
          user = User.find_by(email: params[:username])
          if user&.valid_password?(params[:password])
            success_response_with_json(
              "Successfully logged in.",
              HTTP_CODE[:OK],
              {
                token: JsonWebToken.user_token_encode(user),
                name: user.name,
                phone: user.phone,
                username: user.email,
              }
            )
          else
            error! failure_response_with_json("Invalid username or password", HTTP_CODE[:FORBIDDEN]), HTTP_CODE[:OK]
          end
        rescue StandardError => error
          Rails.logger.error "\n#{__FILE__}\nUser login failed due to: #{error.message}"
          error! failure_response_with_json("User login failed due to: #{error.message}", HTTP_CODE[:FORBIDDEN]), HTTP_CODE[:OK]
        end

        desc 'User Logout.'
        # route_setting :authentication, optional: true
        delete :logout do
          bearer_token = request.headers.fetch('Authorization', '').split(' ').last
          if JsonWebToken.remove_token(bearer_token)
            {
              success: true,
              status: 200,
              message: 'Successfully logout',
            }
          else
            error!(failure_response_with_json('User logout failed', HTTP_CODE[:NOT_ACCEPTABLE]), HTTP_CODE[:OK])
          end
        rescue StandardError => error
          Rails.logger.error "\n#{__FILE__}\nUser logout failed due to: #{error.message}"
          error! failure_response_with_json("User logout failed due to: #{error.message}", HTTP_CODE[:INTERNAL_SERVER_ERROR]), HTTP_CODE[:OK]
        end
      end
    end
  end
end
