class BooksController < ApplicationController
  before_action :ensure_correct_user, only: [:edit]

  def show
    @book = Book.find(params[:id])
    @newcomment = BookComment.new
    @user = @book.user
    @newbook = Book.new
  end

  def index
    if params[:latest]
     @books = Book.latest
   elsif params[:old]
     @books = Book.old
   elsif params[:star_count]
     @books = Book.star_count
    else
     @books = Book.all
   end


    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    tag_list = params[:book][:tag_name].split(',')
    if @book.save_tags(tag_list)
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render:index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render:edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :rate)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
