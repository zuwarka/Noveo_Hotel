# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @rooms = Room.all.order(created_at: :desc)
  end

  def about; end
end
