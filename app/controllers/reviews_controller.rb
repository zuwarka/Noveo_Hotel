# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show]
  def index
    @reviews = Review.all.published.order(created_at: :desc)
    @review = Review.new
  end

  def show; end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    respond_to do |f|
      if @review.save
        f.html { redirect_to review_url(@review), notice: 'Review was created.' }
      else
        f.html { render :new }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:username, :email, :description)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
