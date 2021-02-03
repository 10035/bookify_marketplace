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
    @author =  @book.author[:first_name] +" "+ @book.author[:last_name]
  end
end
