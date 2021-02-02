class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @reviews = Review.all
  end

  def create
    @review = Review.find(params)
    @book = Book.find(params[:book_id])

    @review.book = @book
    @review.save

    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

end
