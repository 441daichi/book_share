class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comments = @review.comments.order(created_at: :desc)
  end

  def edit
    if user_signed_in? && current_user.id == @review.user_id
    else
      redirect_to root_path
    end
  end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    @query = params[:query]
    @genre_id = params[:genre_id]

    @reviews = Review.all

    if @query.present?
      @reviews = @reviews.where('title LIKE ? OR author LIKE ? OR tag LIKE ? OR impression LIKE ?', "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%")
    end

    if @genre_id.present?
      @reviews = @reviews.where(genre_id: @genre_id)
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:image, :title, :author, :genre_id, :tag, :evaluation_id, :impression ).merge(user_id: current_user.id)
  end
end
