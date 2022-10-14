# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::ReviewsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/reviews').to route_to('admin/reviews#index')
    end

    it 'routes to #show' do
      expect(get: '/admin/reviews/1').to route_to('admin/reviews#show', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/reviews/1').to route_to('admin/reviews#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/reviews/1').to route_to('admin/reviews#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/reviews/1').to route_to('admin/reviews#destroy', id: '1')
    end
  end
end
