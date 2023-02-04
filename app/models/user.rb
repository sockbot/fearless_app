class User < ApplicationRecord 
  has_secure_password

  has_one :profile, dependent: :destroy

  attr_accessor :password_digest
  
  validates :email, presence: true, uniqueness: true, email: {mode: :loose, require_fqdn: true}
end
