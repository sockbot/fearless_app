class User < ApplicationRecord 
  has_secure_password

  has_one :profile, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true, email: {mode: :loose, require_fqdn: true}
end
