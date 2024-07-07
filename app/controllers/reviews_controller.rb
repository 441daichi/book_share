class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end
end
