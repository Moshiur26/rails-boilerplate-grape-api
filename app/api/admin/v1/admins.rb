# frozen_string_literal: true

module Admin
    module V1
      class Admins < Admin::Base
        resource '/' do
          params do
            requires :username, type: String
            requires :password, type: String
          end
  
          desc 'Log in to Admin.'
          route_setting :authentication, optional: true
  
          post 'login' do
            admin = Admin.find_by(email: params[:username])
            if admin&.valid_password?(params[:password])
              success_response_with_json(
                "Successfully logged in.",
                HTTP_CODE[:OK],
                {
                  token: JsonWebToken.encode(sub: third_party_user.id),
                  name: admin.name,
                  phone: admin.phone,
                  username: admin.email,
                }
              )
            else
              failure_response_with_json("Invalid username or password", HTTP_CODE[:FORBIDDEN])
            end
          end
        end
      end
    end
  end
  