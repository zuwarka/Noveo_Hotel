class Review < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username,
            presence: true,
            length: { minimum: 3, maximum: 30 }
  validates :email,
            presence: true,
            length: { maximum: 100 },
            format: { with: VALID_EMAIL_REGEX }
  validates :description,
            presence: true,
            length: { maximum: 1000 }
  before_save { self.email = email.downcase }
end