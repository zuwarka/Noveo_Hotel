# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookings/index', type: :view do
  before(:each) do
    assign(:bookings, [
             Booking.create!,
             Booking.create!
           ])
  end

  it 'renders a list of bookings' do
    render
    # cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
