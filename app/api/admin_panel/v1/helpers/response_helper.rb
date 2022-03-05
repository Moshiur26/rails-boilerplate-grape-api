# frozen_string_literal: true
module AdminPanel::V1::Helpers
    module ResponseHelper
      extend Grape::API::Helpers
  
      def respond_with_json(msg, status_code)
        { message: msg, status_code: status_code }
      end
  
      def success_response_with_json(msg, status_code, data = {})
        {
          success: true,
          status_code: status_code,
          message: msg,
          data: data,
        }
      end
  
      def failure_response_with_json(msg, status_code, data = {})
        {
          success: false,
          status_code: status_code,
          message: msg,
          data: data,
        }
      end
    end
end
  