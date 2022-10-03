class Admin::RoomsController < ApplicationController
  before_action :set_room, only: %i[show]
  def index
    @admin_rooms = all_desc_rooms
  end

  def show
    @room_photos = @admin_room.room_photos.all
  end

  def new
    @admin_room = Admin::Room.new
  end

  def edit

  end

  def create
    @admin_room = Admin::Room.new(room_params)
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
    if @admin_room.update(room_params)
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
    @admin_room = Admin::Room.find(params[:id])
  end

  def all_desc_rooms
    Admin::Room.all.order(created_at: :desc)
  end

  def room_params
    params.require(:room).permit(:title, :description, :price)
  end

  def add_room_photos
    params[:room_photos]['photo'].each do |example|
      @room_photo = @admin_room.room_photos.create!(:photo => example, :room_id => @room.id) if example != ""
    end
  end
end