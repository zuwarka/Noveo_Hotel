# frozen_string_literal: true

require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe '/bookings', type: :request do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
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
      get new_booking_url
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
        expect(response).to have_http_status(:unprocessable_entity)
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
        expect(response).to have_http_status(:unprocessable_entity)
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
