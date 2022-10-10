class Booking < ApplicationRecord
  belongs_to :room
  enum status: { pended: 0, confirmed: 1 }

  validates :check_in,
            presence: true
  validates :check_out,
            presence: true
  validates :people,
            presence: true
  validates :room_id,
            presence: true

  after_update :enqueue

  def rooms_are_available
    @booked_rooms = Room.available_rooms(check_in, check_out)
    if @booked_rooms.include?(self.room_id)
      errors.add("This room is not available for these dates.")
    end
  end

  def enqueue
    ExportBookingsJob.perform_later if status == 1
  end

  def self.to_csv
    CSV.generate(col_step: ";") do |csv|
      csv << attribute_names
      confirmed_bookings.find_each do |record|
        csv << record.attributes.values
      end
    end
  end

  def self.to_xlsx
    workbook = RubyXL::Workbook.new
    worksheet = workbook.add_worksheet('Confirmed bookings')
    worksheet.add_cell(0, 0, 'Status')
    worksheet.add_cell(0, 1, 'Username')
    worksheet.add_cell(0, 2, 'Email')
    worksheet.add_cell(0, 3, 'Check_in')
    worksheet.add_cell(0, 4, 'Check_out')
    worksheet.add_cell(0, 5, 'People')
    worksheet.add_cell(0, 6, 'Room_id')
    worksheet.add_cell(0, 7, 'Created_at')
    worksheet.add_cell(0, 8, 'Updated_at')
    counter = 1
    Booking.confirmed_bookings.each do |book|
      worksheet.add_cell(counter, 0, book.status)
      worksheet.add_cell(counter, 1, book.username)
      worksheet.add_cell(counter, 2, book.email)
      worksheet.add_cell(counter, 3, book.check_in)
      worksheet.add_cell(counter, 4, book.check_out)
      worksheet.add_cell(counter, 5, book.people)
      worksheet.add_cell(counter, 6, book.room_id)
      worksheet.add_cell(counter, 7, book.created_at)
      worksheet.add_cell(counter, 8, book.updated_at)
      counter += 1
    end
    workbook.write('confirmed_bookings.xlsx')
  end

  scope :confirmed_bookings, -> { Booking.where(status: 1) }
end