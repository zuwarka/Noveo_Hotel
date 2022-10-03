class RoomPhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :room
  validates :room_id, presence: true
  validates :photo, presence: true
end