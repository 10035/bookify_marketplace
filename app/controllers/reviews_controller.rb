class ReviewsController < ApplicationController
  before_action :set_order, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # link order to review to create review
    @review.order = @order
    # link user to review to create review
    @review.user = current_user

    if @review.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def index
    @reviews = Review.all
    @user_reviews = current_user.reviews
  end

  def destroy
    @review = Review.find(params[:id])
    @order = Order.find(@review.order_id)
    @review.destroy
    redirect_to book_path(@order.book)
  end

  private

  def set_order
    # find the order to link to a new review
    @order = Order.find(params[:order_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
