class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_book, only: [:show, :author, :order]

  def index
    # @books = Book.all
    if params[:query].present?
      @books = Book.where("title ILIKE :query OR description ILIKE :query",  query: "%#{params[:query]}")
    else
      @books = Book.all
    end
    # @books = policy_scope(Book).orders(created_at: :desc)
  end

  def show
    @orders = @book.orders
    @order = Order.new
  end

  def new
    @book = Book.new
    # authorize @book
  end

  def create
    @book = Book.new(book_params)
    # authorize @book
    @author = Author.find(params[:book][:author_id])
    @book.author = @author
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  # using author/book relationship to display author info for a book
  # /books/:id/author
  def author
    @author = @book.author
    @author_name =  @book.author[:first_name] +" "+ @book.author[:last_name]
  end

  def order
    @order = Order.find {|order| order.book_id == @book.id}
    @review = Review.find {|review| review.order_id == @order.id}
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :published_year, :genre, :price, :description, photos: [])
  end
end
