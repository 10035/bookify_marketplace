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
    @author.book_id = @book
    raise
  end
end
