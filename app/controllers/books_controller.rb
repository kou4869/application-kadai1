class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    flash[:notice] = "ブックが正常に作成されました。"
    redirect_to "/books/#{@book.id}"
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end