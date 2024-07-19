class CommentsController < ApplicationController
  before_action :set_review

  def new
    @comment = @review.comments.new
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end
  
end
