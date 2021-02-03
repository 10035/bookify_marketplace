class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new

  end

  def create
    # Book.new()
  end

  def author
    @book = Book.find(params[:id])
    @author_name =  @book.author[:first_name] +" "+ @book.author[:last_name]
  end

  def order
    @book = Book.find(params[:id])
    @order = Order.find {|order| order.book_id == @book.id}
  end
end
