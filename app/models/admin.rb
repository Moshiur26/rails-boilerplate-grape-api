class Admin < ApplicationRecord
    devise :registerable,
         :database_authenticatable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist


    validates :name, :phone, :email, :password, :password_confirmation, presence: true
    validates :email, :phone, uniqueness: true

    enum role: { admin: 0, super_admin: 1 } 
end
