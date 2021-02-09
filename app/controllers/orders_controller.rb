class OrdersController < ApplicationController
  before_action :set_order, only: [:review, :show, :edit, :update, :destroy]

  def review
    # to display an order's review
    @review = @order.review_id
  end

  def index
    #  /orders
    @orders = Order.all
  end

  def show
    # orders/:id
    # grabbing linked book to show book details
    @book = @order.book
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
      redirect_to  book_path(@book)
    else
      render :new
    end

  end

  def edit
  end

  def update
    @order.update(order_params)

    redirect_to orders_path
  end

  def destroy
    @order.destroy

    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:start_date, :end_date, :order_total, :quantity, :status)
  end
end
