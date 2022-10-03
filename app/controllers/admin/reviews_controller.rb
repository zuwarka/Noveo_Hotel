class Admin::ReviewsController < ApplicationController
  before_action :set_review, only: %i[show update destroy]
  def index
    @admin_reviews = admin_published_desc_reviews
  end

  def show
  end

  def update
    if @admin_review.update(published: :true)
      flash[:success] = "Review was updated."
      redirect_to admin_review_url
    else
      flash.now[:error] = "Some errors in the form have appeared"
      redirect_to admin_review_url
    end
  end

  def destroy
    @admin_review.destroy
    flash[:success] = "Review was destroyed"
    redirect_to admin_review_url
  end

  private

  def set_review
    @admin_review = Review.find(params[:id])
  end

  def admin_published_desc_reviews
    Review.all.where(published: :true).order(created_at: :desc)
  end
end