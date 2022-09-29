class Review < ApplicationRecord
  belongs_to :user
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 30 }
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 100 },
            format: { with: VALID_EMAIL_REGEX }
  validates :description,
            presence: true,
            length: { maximum: 1000 }
  before_save { self.email = email.downcase }
end