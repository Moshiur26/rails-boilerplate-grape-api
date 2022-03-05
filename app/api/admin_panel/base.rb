module AdminPanel
    class Base < Grape::API
      # Contains all the constant that will be used for development
      include AdminPanel::V1::Helpers::Constants
      include Grape::Kaminari
  
      # Helpers to send success or failure message to frontend
      helpers AdminPanel::V1::Helpers::ResponseHelper
  
      helpers CommonHelper
  
      version 'v1', using: :path
      format :json
      prefix :api
      formatter :json, Grape::Formatter::Json
  
      #############################
      # Admin JWT Authentication
      #############################
  
      before do
        ActiveStorage::Current.host = request.base_url
        auth_optional = route&.settings&.dig(:authentication, :optional)
        if auth_optional
          # allow guest users if the endpoint specifies so
          Rails.logger.info 'Authentication optional for this endpoint'
        else
          error!('401 Unauthorized', 401) unless authenticated!
        end
      end
  
      helpers do
        def authenticated!
          payload = JsonWebToken.decode(bearer_token)
          # payload['exp'] >= Time.now.to_i &&
          #   @current_admin = Admin.find_by(id: payload['sub'])
        rescue StandardError => ex
          Rails.logger.error "Error occurs during Authentication. Message: #{ex.full_message}"
          error!('Something went wrong', 500)
        end
  
        def bearer_token
          request.headers.fetch('Authorization', '').split(' ').last
        end
      end
  
      @error = []
  
      mount V1::Admins
  
      HTTP_ERROR = [400, 401, 403, 404, 422, 500, 503, 999].freeze
    end
  end
  