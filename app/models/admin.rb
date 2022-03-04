class Admin < ApplicationRecord
    enum role: { admin: 0, super_admin: 1 } 
  end
  