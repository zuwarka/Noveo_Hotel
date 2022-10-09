class RoomsController < ApplicationController
  before_action :set_room, only: %i[show]
  def index
    @rooms = Room.all.order(created_at: :desc)
  end

  def show
    #@room.room_photos.all
    @booking = Booking.new
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end