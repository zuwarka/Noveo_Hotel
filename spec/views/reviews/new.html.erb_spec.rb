# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews/new', type: :view do
  before(:each) do
    assign(:review, Review.new)
  end

  it 'renders new review form' do
    render
  end
end
