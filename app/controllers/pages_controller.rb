class PagesController < ApplicationController
  def index
    #@rooms = Room.paginate(page: params[:page], per_page: 2)
    #currency_api_check_error
  end

  def about

  end

  private
  #@path != 'daily_json' && @path != 'latest' &&
  def currency_api_check_error
    @path = params[:query_path]
    if @path.blank? || (@path != 'daily_jsonp')
      render json: { error: true, message: "Invalid query_path" }, status: :bad_request
    end
  end
end