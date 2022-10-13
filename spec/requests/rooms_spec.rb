# frozen_string_literal: true

require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe '/rooms', type: :request do
  let(:valid_attributes) do
    {
      title: Faker::Lorem.words,
      description: Faker::Lorem.sentence,
      price: Random.rand(1..1000)
    }
  end

  let(:invalid_attributes) do
    {
      title: "",
      description: "",
      price: ""
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Room.create! valid_attributes
      get rooms_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      room = Room.create! valid_attributes
      get room_url(room)
      expect(response).to be_successful
    end
  end
end
# rubocop:enable Metrics/BlockLength
