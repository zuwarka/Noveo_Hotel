# frozen_string_literal: true

class ExportBookingsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Booking.to_csv
    Booking.to_xlsx
  end
end
