class OrdersController < ApplicationController
  before_action :set_order, only: [:review, :show, :edit, :update, :destroy]

  # ADDS A BOOK REVIEW ON VIEWS/ORDERS/SHOW
  def review
    # to display an order's review or reviews on a page
    @review = @order.review_id
  end

  def index
    #  /orders
    @orders = Order.all
    @user_orders = current_user.orders
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
    # finding book to link to @order to create order
    @book = Book.find(params[:book_id])
    # linking book to order
    @order.book = @book
    # linking user to order
    @order.user = current_user

    if @order.save
      redirect_to  book_path(@book)
    else
      render :new
    end

  end

  def edit
  end

  def update
    @order.update(order_params)

    redirect_to order_path(@order)
  end

  def destroy
    # deletes an order and it's review
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
