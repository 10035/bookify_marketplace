class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_book, only: [:show, :author, :order, :destroy]


  # THIS CODE ALLOWS USER TO SEARCH BOOKS BY AUTHOR FIRST AND LAST NAME, AND BOOK TITLE AND DESCRIPTION
  def index
    if params[:query].present?
      sql_query = " \
              books.title ILIKE :query \
              OR books.description ILIKE :query \
              OR authors.last_name ILIKE :query \
              OR authors.first_name ILIKE :query \
              "
      @books = Book.joins(:author).where(sql_query, query: "%#{params[:query]}%")
    else
      @books = Book.all
    end
  end

  #   # @books = policy_scope(Book).orders(created_at: :desc)
  # end

  def show
    # Could be   used as a way to display if book has been rented?
    # /books/:id
    # grab orders showing a user's order history for a book on book show page
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
    # attaching author to new book to be able to "create book"
    @author = Author.find(params[:book][:author_id])
    @book.author = @author

    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def destroy
    # deletes a book
    @book.destroy

    redirect_to books_path
  end

  def author
    # using author/book relationship to display author info for a book
    # /books/:id/author
    @author = @book.author
    @author_name =  @book.author[:first_name] + " " + @book.author[:last_name]
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :published_year, :genre, :price, :description, photos: [])
  end
end
