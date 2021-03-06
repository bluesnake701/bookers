class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new (list_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
    flash[:success] = 'Book was successfully created.'
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(list_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
    flash[:success] = 'Book was successfully updated.'
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private

  def list_params
    params.require(:book).permit(:title, :body)
  end
end
