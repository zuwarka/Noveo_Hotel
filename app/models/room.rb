# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :booking
  has_many_attached :room_photos, dependent: :destroy

  validates :title,
            presence: true,
            length: { minimum: 5, maximum: 100 }
  validates :description,
            presence: true,
            length: { minimum: 10, maximum: 5000 }

  def self.available_rooms(check_in, check_out)
    Booking.excluded_id(check_in, check_out)
  end
end
