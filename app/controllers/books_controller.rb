class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    current_user.books.create(book_params)
    redirect_to root_path
  end
  
  def show
    @book = Book.find(params[:id])
  end 
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
    redirect_to root_path
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end
  
  private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end

end
