class Book < ApplicationRecord
  #Bookモデルにtitleとbodyに加えて画像を扱うためのimageカラムを追加
  has_one_attached :image
  
  #Userモデルとのアソシエーション
  belongs_to :user
  
  
end
