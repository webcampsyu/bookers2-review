class BookComment < ApplicationRecord
  
  #Userモデル,Bookモデルとのアソシエーション
  belongs_to :user
  belongs_to :book
end
