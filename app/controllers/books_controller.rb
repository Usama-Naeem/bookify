class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destory]
  load_and_authorize_resource
  before_action :find_book, only: [:edit, :update, :show, :destory]

  def index
    @books = Book.all.order("created_at DESC")
  end

  def show
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :author, :isbn, :user_id, :admin, :owner, :book_img, :search, :category_ids => [])
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
