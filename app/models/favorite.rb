class Favorite < ApplicationRecord
  #BookモデルとUserモデルとのアソシエーション
  belongs_to :book
  belongs_to :user
end
