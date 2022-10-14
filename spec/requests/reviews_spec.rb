# frozen_string_literal: true

require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe '/reviews', type: :request do
  let(:valid_attributes) do
    {
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      description: Faker::Lorem.sentence
    }
  end

  let(:invalid_attributes) do
    {
      title: '',
      description: '',
      price: ''
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Review.create! valid_attributes
      get reviews_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_review_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Review' do
        expect do
          post reviews_url, params: { review: valid_attributes }
        end.to change(Review, :count).by(1)
      end

      it 'redirects to the created review' do
        post reviews_url, params: { review: valid_attributes }
        expect(response).to redirect_to(review_url(Review.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Review' do
        expect do
          post reviews_url, params: { review: invalid_attributes }
        end.to change(Review, :count).by(0)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
