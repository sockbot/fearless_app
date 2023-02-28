class User < ApplicationRecord 
  OWASP_MINIMUM_SECURE_TOKEN_LENGTH = 32

  has_secure_password
  has_secure_token :password_reset_token, length: OWASP_MINIMUM_SECURE_TOKEN_LENGTH

  has_one :profile, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true, email: {mode: :loose, require_fqdn: true}
end
