class Booking < ApplicationRecord
  belongs_to :room
  enum status: { pended: 0, confirmed: 1 }

  validates :check_in,
            presence: true
  validates :check_out,
            presence: true
  validates :people,
            presence: true
  validates :room_id,
            presence: true

  def rooms_are_available
    @booked_rooms = Room.available_rooms(check_in, check_out)
    if @booked_rooms.include?(self.room_id)
      errors.add("This room is not available for these dates.")
    end
  end
end