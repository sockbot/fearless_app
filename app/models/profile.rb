class Profile < ApplicationRecord
  belongs_to :user

  validates :icq, allow_nil: true, numericality: { only_integer: true }
end