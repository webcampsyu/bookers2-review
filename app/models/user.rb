class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #Bookモデルとのアソシエーション
  #[1:N]の[1]側がhas_manyになる
  #複数のBookモデルと関連付けるために複数形
  has_many :books, dependent: :destroy
  
  #プロフィール画像を保存できるように設定
  has_one_attached :profile_image
  
  #画像表示するための記述
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end 
    profile_image.variant(resize_to_limit: [width, height]).processed
  end 
    
end
