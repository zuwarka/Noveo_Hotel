# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::BookingsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/bookings').to route_to('admin/bookings#index')
    end

    it 'routes to #show' do
      expect(get: '/admin/bookings/1').to route_to('admin/bookings#show', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/bookings/1').to route_to('admin/bookings#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/bookings/1').to route_to('admin/bookings#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/bookings/1').to route_to('admin/bookings#destroy', id: '1')
    end
  end
end
