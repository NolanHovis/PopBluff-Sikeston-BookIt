class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :destroy, :update]

  def show
    
  end

  def index 
    @books = Book.all
  end

  def new 
    @book = Book.new()
  end

  def create 
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was Saved!"
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
   
  end

  def update
    
    if @book.update(book_params)
      flash[:message] = "Book was Updated!"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    
    flash[:message] = "#{@book.title} was Destroyed!"
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description)
  end
end
