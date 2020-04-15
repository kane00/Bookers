class BooksController < ApplicationController

  def top
  end

  def show
  	@book = Book.find(params[:id])
  end

  def index
    @book = Book.new
  	@books = Book.all
  end

  def new
  	@books = Book.all
    @book = Book.new
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "successfully"
    else
      render :edit, notice:"error"
      @book = Book.all
    end
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
      flash[:notice] = "you have created book successfully"
      redirect_to book_path(@book)
    else
      @books = Book.all
      render("books/index")
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to("/books")
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
