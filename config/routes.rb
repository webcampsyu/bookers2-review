Rails.application.routes.draw do
  
  devise_for :users #deveiseを使用する際urlにusersを含むことの意味
  root to: "homes#top"
  
  #resourcesメソッドでルーティングを生成
  #onlyオプションで生成するルーティングを限定
  #booksコントローラにbooks_commentsコントローラをネストする(親子関係)
  #ネストすることでurlを作成しparams[:book_id]でBookのidが取得できるようになる(rails routes参照)
  resources :books, only: [:index, :show, :create, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end 
  resources :users, only: [:show, :edit, :update]
  get 'homes/about' => "homes#about", as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
