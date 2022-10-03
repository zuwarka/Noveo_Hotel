class Admin::RoomsController < ApplicationController
  before_action :set_room, except: %i[index new create]
  def index
    @admin_rooms = all_desc_rooms
  end

  def show
    @room_photos = @admin_room.room_photos.all
  end

  def new
    @admin_room = Room.new
  end

  def edit

  end

  def create
    @admin_room = Room.new(admin_room_params)
    if @admin_room.save
      add_room_photos
      flash[:success] = "Room was added"
      redirect_to admin_room_url(@admin_room)
    else
      flash.now[:error] = "Some errors in the form have appeared"
      render :new
    end
  end

  def update
    if @admin_room.update(admin_room_params)
      add_room_photos
      flash[:success] = "Room was updated"
      redirect_to admin_room_url(@admin_room)
    else
      flash.now[:error] = "Some errors in the form have appeared"
      render :edit
    end
  end

  def destroy
    @admin_room.destroy
    flash[:success] = "Room was destroyed"
    redirect_to admin_room_url
  end

  private

  def set_room
    @admin_room = Room.find(params[:id])
  end

  def all_desc_rooms
    Room.all.order(created_at: :desc)
  end

  def admin_room_params
    params.require(:room).permit(:title, :description, :price)
  end

  def add_room_photos
    params[:room_photos]['photo'].each do |example|
      @room_photo = @admin_room.room_photos.create!(:photo => example, :room_id => @room.id) if example != ""
    end
  end
end