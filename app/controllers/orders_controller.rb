class OrdersController < ApplicationController
  def review
    @order = Order.find(params[:id])
    @review = @order.review_id
  end

  def index
    # @book = Book.find(params[:book_id])
    # @order = @book.orders

    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
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
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

    redirect_to orders_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date, :order_total, :quantity, :status)
  end
end
