class CommentsController < ApplicationController
  before_action :set_review

  def new
    @comment = @review.comments.new
  end

  def create
    @comment = @review.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to review_path(@review)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end


  def comment_params
    params.require(:comment).permit(:comment_text)
  end

end
