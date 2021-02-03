class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end


  def create
    @book = Book.new(book_params)
    @author = Author.find(params[:book][:author])
    @book.author = @author

    if @book.save
      redirect_to books_path

    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :published_year, :genre, :price, :description, )
  end
end
