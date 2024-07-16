class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    Review.create(review_params)
    redirect_to '/'
  end

  private

  def review_params
    params.require(:review).permit(:image, :title, :author, :genre_id, :tag, :evaluation_id, :impression ).merge(user_id: current_user.id)
  end
end
