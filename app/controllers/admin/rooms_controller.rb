class Admin::RoomsController < ApplicationController
  before_action :set_room, except: %i[index new create]
  def index
    @rooms = Room.all.order(created_at: :desc)
  end

  def show
    @room_photos = @room.room_photos.all
  end

  def new
    @room = Room.new
  end

  def edit

  end

  def create
    @room = Room.new(admin_room_params)
    add_room_photos
    respond_to do |f|
      if @room.save
        f.html { redirect_to admin_rooms_url(@room), notice: "Room was created." }
      else
        f.html { render :new, status: :bad_request }
      end
    end
  end

  def update
    add_room_photos
    respond_to do |f|
      if @room.update(admin_room_params)
        f.html { redirect_to admin_rooms_url(@room), notice: "Room was updated." }
      else
        f.html { render :edit, status: :bad_request }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |f|
      f.html { redirect_to rooms_url, notice: "Room was destroyed." }
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def admin_room_params
    params.require(:room).permit(:title, :description, :price, room_photos: [])
  end

  def add_room_photos
    @room.room_photos.attach(params[:room_photos])
  end
end