Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    # ルーティングに追加
    resources :comments
  end

  root 'posts#index'
end
