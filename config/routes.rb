Rails.application.routes.draw do
  root 'main#index'
  resources :posts, defaults: {format: :json}, only: [:index, :show, :create]
  resources :categories, defaults: {format: :json}
  resources :comments, defaults: {format: :json}
end
