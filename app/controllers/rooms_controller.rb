class RoomsController < ApplicationController
  before_action :set_room, only: %i[show]
  def index
    @rooms = all_desc_rooms
  end

  def show
    @room_photos = @room.room_photos.all
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def all_desc_rooms
    Room.all.order(created_at: :desc)
  end
end