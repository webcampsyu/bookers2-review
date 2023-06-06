class BooksController < ApplicationController
  
  #投稿データの保存
  def create
    @book = Book.new(book_params) #投稿するデータをBookモデルに紐づくデータとして保存する準備をしていてフォームに入力された(title,body)が@bookに格納される
    @book.user_id = current_user.id #投稿者id(@book.user_id)をログイン中のユーザのidを持たせる
    if @book.save
     redirect_to books_path
    else 
     @books = Book.all
     @user = User.find(current_user.id)
     render :index
    end 
  end 
  

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comment = BookComment.new #コメントを投稿するためのインスタンス変数
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end 
  
  #投稿データのストロングパラメータ
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end 
  
end
