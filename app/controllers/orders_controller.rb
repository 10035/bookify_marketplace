class OrdersController < ApplicationController
  def review
    @order = Order.find(params[:id])
    @review = @order.review_id
  end

  def index
    @book = Book.find(params[:book_id])
    @orders = @book.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @book = Book.find(params[:book_id])
    @order.book = @book
    @order.user = current_user

    if @order.save
      # redirect_to book_path(@book)
      redirect_to  book_orders_path(@book)
    else
      render :new
    end

  end

  def edit

  end

  def update

  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date, :order_total, :quantity, :status)
  end
end
