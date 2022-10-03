class Admin::BookingsController < ApplicationController
  before_action :set_booking, except: %i[index]
  def index
    @admin_bookings = admin_desc_booking
  end

  def show

  end

  def update
    if @admin_booking.update(confirmed: :true)
      flash[:success] = "Book for room was updated."
      redirect_to admin_booking_path
    else
      flash.now[:error] = "Some error has appeared."
      redirect_to admin_booking_path
    end
  end

  def destroy
    @admin_booking.destroy
    flash[:success] = "Book for room was destroyed."
    redirect_to admin_booking_path
  end

  private

  def set_booking
    @admin_booking= Review.find(params[:id])
  end

  def admin_desc_booking
    Booking.all.where(confirmed: :false).order(created_at: :desc)
  end
end