class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #全体の投稿ではなく、個人の投稿を取得する
    @books = @user.books #アソシエーションを持っているモデル同士の記述
  end

  def edit
  end
end
