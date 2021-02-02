class ReviewsController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
    @reviews = Review.all
  end

  def create
    @review = Review.find(params)
    @order = Order.find(params[:order_id])

    @review.order = @order
    @review.save

    if @review.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
