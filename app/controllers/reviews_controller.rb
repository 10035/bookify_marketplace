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

  def show
    @review = Review.all   
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to books_path
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
