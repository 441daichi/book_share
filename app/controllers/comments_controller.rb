class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_review

  def new
    if user_signed_in? && current_user.id == @review.user_id
      redirect_to root_path, alert: "自分のレビューにコメントを投稿することはできません。"
    else
      @comment = Comment.new
    end
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
