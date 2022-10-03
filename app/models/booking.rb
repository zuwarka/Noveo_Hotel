class Booking < ApplicationRecord
  belongs_to :room

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
  validates :check_in,
            presence: true
  validates :check_out,
            presence: true
  validates :people,
            presence: true
  validates :room_id,
            presence: true

  before_save { self.email = email.downcase }
end