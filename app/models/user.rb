class User < ApplicationRecord 
  has_secure_password

  attr_accessor :password_digest
  
  validates :email, presence: true, uniqueness: true
end
