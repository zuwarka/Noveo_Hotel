# frozen_string_literal: true

require 'rails_helper'
require 'date'
# rubocop:disable Metrics/BlockLength
RSpec.describe '/bookings', type: :request do
  let(:valid_attributes) do
    {
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      status: 1,
      check_in: DateTime.new(2022, 10, 10),
      check_out: DateTime.new(2022, 12, 12),
      people: Random.rand(1..10),
      room_id: 1
    }
  end

  let(:invalid_attributes) do
    {
      username: '',
      email: '',
      status: 1,
      check_in: '',
      check_out: '',
      people: '',
      room_id: 0
    }
  end

  before do
    Room.create!(id: 1, title: 'I am the room', description: 'I am description', price: 300)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Booking.create! valid_attributes
      get bookings_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      booking = Booking.create! valid_attributes
      get booking_url(booking)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      Booking.create! valid_attributes
      get new_booking_url, params: { room_id: '1""' }
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Booking' do
        expect do
          post bookings_url, params: { booking: valid_attributes }
        end.to change(Booking, :count).by(1)
      end

      it 'redirects to the created booking' do
        post bookings_url, params: { booking: valid_attributes }
        expect(response).to redirect_to(booking_url(Booking.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Booking' do
        expect do
          post bookings_url, params: { booking: invalid_attributes }
        end.to change(Booking, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post bookings_url, params: { booking: invalid_attributes }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested booking' do
        booking = Booking.create! valid_attributes
        patch booking_url(booking), params: { booking: new_attributes }
        booking.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the booking' do
        booking = Booking.create! valid_attributes
        patch booking_url(booking), params: { booking: new_attributes }
        booking.reload
        expect(response).to redirect_to(booking_url(booking))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        booking = Booking.create! valid_attributes
        patch booking_url(booking), params: { booking: invalid_attributes }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested booking' do
      booking = Booking.create! valid_attributes
      expect do
        delete booking_url(booking)
      end.to change(Booking, :count).by(-1)
    end

    it 'redirects to the bookings list' do
      booking = Booking.create! valid_attributes
      delete booking_url(booking)
      expect(response).to redirect_to(bookings_url)
    end
  end
end
# rubocop:enable Metrics/BlockLength
