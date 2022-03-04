# frozen_string_literal: true

module Admin
    module V1
      class Users < ThirdPartyService::Base
        resource '/' do
          params do
            requires :username, type: String
            requires :password, type: String
          end
  
          desc 'Log in to third_party staff.'
          route_setting :authentication, optional: true
  
          post 'login' do
            third_party_user = ThirdPartyUser.find_by(email: params[:username])
            if third_party_user&.valid_password?(params[:password])
              success_response_with_json(
                "Successfully logged in.",
                HTTP_CODE[:OK],
                {
                  token: JsonWebToken.encode(sub: third_party_user.id),
                  name: third_party_user.name,
                  phone: third_party_user.phone,
                  username: third_party_user.email,
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
  