# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rooms/edit', type: :view do
  before(:each) do
    @room = assign(:room, Room.create!)
  end

  it 'renders the edit room form' do
    render
  end
end
