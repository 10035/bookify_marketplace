class OrdersController < ApplicationController
  def index
    @orders = Order.all
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
    @order.user = current_user

    if @order.save
      redirect_to book_path(@book)
    else
      render :new
    end

  end

  private

  def order_params
    params.require(:order).permit(:order_date, :order_total, :quantity, :status)
  end
end
