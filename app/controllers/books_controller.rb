class BooksController < ApplicationController
  #top以外はログインしていないと見れない
    before_action :authenticate_user!,  except: :top
  def top
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id), flash: {notice: "投稿されました"}
    else
       @books = Book.all
       render :index

    end

  end

  def index
    @user = User.find(current_user.id)
  	@book = Book.new
    @books = Book.all
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(params[:id]), flash: {notice: "保存されました"}
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to mypage_path(current_user.id), flash: {notice: "削除されました"}
  end

  def mypage
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def usersinfo
    @users = User.all
  end

  def usershow
    @user = User.find(params[:id])
    @books = Book.all
  end

  private


  def book_params
  		params.require(:book).permit(:title, :body, :user_id)
  end
end
