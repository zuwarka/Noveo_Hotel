class PagesController < ApplicationController
  def index
    @rooms = Room.paginate(page: params[:page], per_page: 2)
  end

  def about

  end
end