class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.create(book_params)
    if @book.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end 
  
  def edit
    @book = Book.find(params[:id])
    
    if @book.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
    
    @book.update_attributes(book_params)
    if @book.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    if @book.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
    
    @book.destroy
    redirect_to root_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :image, :video)
  end

end
