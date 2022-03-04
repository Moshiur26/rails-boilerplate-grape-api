class AuthorizationKey < ApplicationRecord
    belongs_to :authable, polymorphic: true
  
    def is_expired?
      expiry.to_i < Time.now.to_i
    end
  end
  