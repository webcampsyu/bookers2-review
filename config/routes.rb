Rails.application.routes.draw do
  
  devise_for :users #deveiseを使用する際urlにusersを含むことの意味
  root to: "homes#top"
  
  #resourcesメソッドでルーティングを生成
  #onlyオプションで生成するルーティングを限定
  resources :books, only: [:index, :show, :create, :destroy]
  resources :users, only: [:show, :edit]
  get 'homes/about' => "homes#about", as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
