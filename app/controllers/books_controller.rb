class BooksController < ApplicationController

  def index
    @books = Book.all 
  end

  def show
    @books = Book.find(params[:id])
  end

  def new
    @books = Book.new
  end

  def edit
    @books = Book.find(params[:id])
  end

  def create
    @books = Book.new(book_params)

    if @books.save
      flash[:notice] = 'Book was successfully created!'  
      redirect_to @books
    else
      render :new
    end
  end
    
  def update
    @books = Book.find(params[:id])  
    if @books.update(book_params)
      flash[:notice] = 'Book was successfully updated!' 
      redirect_to @books
    else
      render :edit
    end
  end

  def destroy
    @books = Book.find(params[:id])  
    if @books.destroy
        flash[:notice] = 'Book was successfully deleted!'
    else
        flash[:notice] = 'Unable to delete the book! Sorry!'
    end
    redirect_to books_url 
  end

  private
    def book_params
      params.require(:book).permit(:name, :creater_id)
    end
      
end
