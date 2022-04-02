# frozen_string_literal: true

module AdminPanel
    module V1
      class Admins < AdminPanel::Base
        resource '/' do
          params do
            requires :username, type: String
            requires :password, type: String
          end
  
          desc 'Log in to Admin.'
          route_setting :authentication, optional: true
  
          post :login do
            admin = Admin.find_by(email: params[:username])
            if admin&.valid_password?(params[:password])
              success_response_with_json(
                "Successfully logged in.",
                HTTP_CODE[:OK],
                {
                  token: JsonWebToken.encode(sub: admin.id),
                  name: admin.name,
                  phone: admin.phone,
                  username: admin.email,
                }
              )
            else
              error! failure_response_with_json("Invalid username or password", HTTP_CODE[:FORBIDDEN]), HTTP_CODE[:OK]
            end
          rescue StandardError => error
            Rails.logger.error "\n#{__FILE__}\nAdmin login failed due to: #{error.message}"
            error! failure_response_with_json("Admin login failed due to: #{error.message}", HTTP_CODE[:FORBIDDEN]), HTTP_CODE[:OK]
          end
        end
      end
    end
end
