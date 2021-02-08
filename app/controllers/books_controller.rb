class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]


  def index
    @books = Book.all
    # @books = policy_scope(Book).orders(created_at: :desc)
  end

  def show
    @book = Book.find(params[:id])
    @orders = @book.orders

    @order = Order.new
  end

  def new
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    authorize @book
    @author = Author.find(params[:book][:author_id])
    @book.author = @author
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def author
    @book = Book.find(params[:id])
    @author = @book.author
    @author_name =  @book.author[:first_name] +" "+ @book.author[:last_name]
  end

  def order
    @book = Book.find(params[:id])
    @order = Order.find {|order| order.book_id == @book.id}
    @review = Review.find {|review| review.order_id == @order.id}
  end

  private

  def book_params
    params.require(:book).permit(:title, :published_year, :genre, :price, :description, photos: [])
  end
end
