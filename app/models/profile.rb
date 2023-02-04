class Profile < ApplicationRecord
  belongs_to :user

  validates :icq, numericality: { only_integer: true }
end