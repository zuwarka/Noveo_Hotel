class RoomPhotosController < ApplicationController
  before_action :set_room_photo, only: %i[show edit update destroy]

  def index
    @room_photos = all_desc_room_photos
  end

  def show
  end

  def new
    @room_photo = RoomPhoto.new
  end

  def edit
    @room = @room_photo.room
  end

  def create
    @room_photo = RoomPhoto.new(room_photo_params)
    if @room_photo.save
      flash[:success] = "Room's photo was created."
      redirect_to room_photo_url(@room_photo)
    else
      flash.now[:error] = "Some errors in the form have appeared"
      render 'admin/rooms/new'
    end
  end

  def update
    if @room_photo.update(room_photo_params)
      flash[:success] = "Room's photo was updated."
      redirect_to room_photo_url(@room_photo)
    else
      flash.now[:error] = "Some errors in the form have appeared"
      render :edit
    end
  end

  def destroy
    @room_photo.destroy

    flash[:success] = "Room's photo was destroyed."
    redirect_to @room_photo.room
  end

  private

  def set_room_photo
    @room_photo = RoomPhoto.find(params[:id])
  end

  def room_photo_params
    params.require(:room_photo).permit(:room_id, :photo)
  end

  def all_desc_room_photos
    RoomPhoto.all.order(created_at: :desc)
  end
end