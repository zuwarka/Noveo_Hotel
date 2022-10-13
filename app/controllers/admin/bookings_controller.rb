#require 'csv'
class Admin::BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show edit update destroy confirmation]
  def index
    @bookings = Booking.all.order(created_at: :desc)
  end

  def show
    @room = @booking.room
  end

  def update
    respond_to do |f|
      if @booking.update(booking_params)
        f.html { redirect_to admin_booking_url(@booking), notice: "Booking was updated." }
      else
        f.html { render :new, status: :bad_request }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |f|
      f.html { redirect_to admin_bookings_url, notice: "Booking was destroyed." }
    end
  end

  def confirmation
    if @booking.pended?
      @booking.confirmed!
    elsif @booking.confirmed?
      @booking.pended!
    end
    respond_to do |f|
      f.html { redirect_to admin_bookings_url, notice: "Booking status was updated." }
    end
  end

  def export
    @bookings = Booking.confirmed_bookings
    respond_to do |f|
      f.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment;filename=confirmed_bookings.csv"
        render template: "admin/bookings/index"
      end

      f.xlsx do
        response.headers['Content-Type'] = 'text/xlsx'
        response.headers['Content-Disposition'] = "attachment;filename=confirmed_bookings.xlsx"
        render xlsx: 'bookings', template: "admin/bookings/index"
      end
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:username, :email, :check_in, :check_out, :people, :room_id)
  end
end
