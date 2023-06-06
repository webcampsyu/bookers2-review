class Book < ApplicationRecord
  #Bookモデルにtitleとbodyに加えて画像を扱うためのimageカラムを追加
  has_one_attached :image
  
  #Userモデルとのアソシエーション
  #1人のユーザが複数投稿できる(1:N)
  belongs_to :user
  
  #BookCommentモデルとのアソシエーション
  #1個の投稿に複数のコメントができる(1:N)
  has_many :book_comments, dependent: :destroy
  
  #Favoriteモデルとのアソシエーション
  #1個の投稿に複数のいいねができる(1:N)
  has_many :favorites, dependent: :destroy
  
  #favorited_by?メソッドで引数に渡されたユーザidがFavoritesテーブル内に存在するかを判定
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end 
  
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200 }
end
