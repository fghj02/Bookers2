class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only: [:edit, :update,:destroy]

  def new
    @book = Book.new
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if  @book.save
     flash[:notice] = "Book was successfully created."
    redirect_to books_path
   else
     @books = book.all
     render :index
   end
  end

  def index
    @books = Book.all
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    @book = book.find(params[:id])
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
     flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:book_name, :image, :book_body)
  end

  def ensure_current_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
       redirect_to books_path
    end
  end

end
