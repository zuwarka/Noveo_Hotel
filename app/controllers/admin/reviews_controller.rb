class Admin::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: %i[show update destroy confirmation]
  attr_reader :review
  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def show
  end

  def update
    respond_to do |f|
      if @review.update(review_params)
        f.html { redirect_to admin_review_url(@review), notice: "Review was updated." }
      else
        f.html { render :edit, status: :bad_request }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |f|
      f.html { redirect_to admin_reviews_url, notice: "Review was destroyed." }
    end
  end

  def confirmation
    if @review.pended?
      @review.published!
    elsif @review.published?
      @review.pended!
    end

    redirect_to admin_reviews_url, notice: "Review status was updated."
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:username, :email, :description)
  end
end