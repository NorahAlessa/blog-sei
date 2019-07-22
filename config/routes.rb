Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
get 'pages/private_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, :comments, :users
 
  # root "posts#index"
 
end
