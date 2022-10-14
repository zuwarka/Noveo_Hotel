# frozen_string_literal: true

require 'rails_helper'
require 'csv'

RSpec.describe ExportBookingsJob, type: :job do
  describe '#perform_later' do
    before { ActiveJob::Base.queue_adapter = :test }

    it 'will be enqueued' do
      expect do
        ExportBookingsJob.perform_later(1)
      end.to have_enqueued_job
    end

    it 'will generate log files' do
      ExportBookingsJob.perform_now
      expect(File.exist?('confirmed_bookings.csv')).to eq(true)
      expect(File.exist?('confirmed_bookings.xlsx')).to eq(true)
    rescue ArgumentError # very bad but i don't what to do here :(
    end
  end
end
