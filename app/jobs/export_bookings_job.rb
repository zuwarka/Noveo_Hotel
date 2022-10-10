class ExportBookingsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Booking.to_csv
    Booking.to_xlsx
  end
end