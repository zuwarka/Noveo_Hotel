# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/reviews').to route_to('reviews#index')
    end

    it 'routes to #new' do
      expect(get: '/reviews/new').to route_to('reviews#new')
    end

    it 'routes to #show' do
      expect(get: '/reviews/1').to route_to('reviews#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/reviews').to route_to('reviews#create')
    end
  end
end
