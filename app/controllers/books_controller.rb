class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
       flash[:notice] = "successfully"
       redirect_to book_path(@book.id)
    else
       flash.now[:alert] = "Please write"
       render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
        flash[:notice] = "successfully"
       redirect_to book_path(@book.id)
    else 
      render :edit
    end
  end    
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
