class User < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password
  has_secure_password validations: true

  attr_accessor :password_digest

  validates :email, presence: true
  validates :password_digest, presence: true
end
