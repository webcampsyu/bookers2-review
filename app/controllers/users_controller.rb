class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #全体の投稿ではなく、個人の投稿を取得する
    @books = @user.books #アソシエーションを持っているモデル同士の記述
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end 
end
