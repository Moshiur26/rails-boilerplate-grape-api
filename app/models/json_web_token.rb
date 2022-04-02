class JsonWebToken
  def self.encode(payload)
    expiration = 1.year.from_now.to_i
    JWT.encode payload.merge(exp: expiration), Rails.application.secret_key_base
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secret_key_base).first
  end

  def self.remove_token(bearer_token = '')
    auth_key = AuthorizationKey.find_by(token: bearer_token) if bearer_token.present?
    auth_key.destroy! if auth_key.present?
    auth_key.present? ? auth_key.destroyed? : false
  end

  def self.user_token_encode(user, bearer_token = '')
    new_has = token_hash(user)
    auth_key = AuthorizationKey.find_by(token: bearer_token) if bearer_token.present?
    auth_key.present? && auth_key&.authable_id == user&.id ? auth_key.update!(expiry: new_has[:expiry], token: new_has[:token]) : AuthorizationKey.create!(new_has)
    new_has[:token]
  end

  def self.single_login_token_encode(user)
    new_has = token_hash(user)
    user&.authorization_key&.present? ? user.authorization_key.update!(token: new_has[:token], expiry: new_has[:expiry]) : AuthorizationKey.create!(token: new_has[:token], expiry: new_has[:expiry], authable: user)
    new_has[:token]
  end

  def self.new_auth_key(user)
    AuthorizationKey.create!(token_hash(user))
  end

  def self.token_hash(user)
    expiry = 3.month.from_now
    rand = SecureRandom.hex(10)
    hash = BCrypt::Password.create(rand)
    token = JWT.encode hash, Rails.application.secret_key_base
    { expiry: expiry, token: token, authable: user }
  end
end
