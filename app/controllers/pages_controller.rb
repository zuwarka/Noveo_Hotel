# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    # @hotel_rooms_photo = []
    # Room.all.each do |room|
    #  room.room_photos.limit(1).each do |ph|
    #    @hotel_rooms_photo.push(ph)
    #  end
    # end
    @rooms = Room.limit(3)
  end

  def about; end
end
