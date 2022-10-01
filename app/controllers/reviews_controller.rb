class ReviewsController < ApplicationController
  #before_action :set_review, only: %i[show]
  def index
    @reviews = published_desc_reviews
    @review = Review.new
  end

  def show
    set_review
  end

  def create
    @review = Review.new(review_params)
    @review.published = false

    if @review.save
      flash[:success] = "Your review was created. It will appear in Reviews after approval."
      redirect_to review_path(@review)
    else
      flash.now[:error] = "Some errors in the form have appeared"
      @review = published_desc_reviews
      render 'index'
    end
  end

  private

  def review_params
    params.require(:review).permit(:username, :email, :description)
  end

  def set_review
    @review = Review.find_by(id: params[:id].to_i)
    #@review = Review.where(id: params[:id]).all
  end

  def published_desc_reviews
    Review.all.where(published: true).order(created_at: :desc)
  end
end