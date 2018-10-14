Rails.application.routes.draw do
  root 'recipes#index'
  devise_for :users
  resources :users, only: :show
  resources :tags, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/messages', to: 'messages#reply'
  resources :recipes do
    resources :favorites, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :messages, only: [:create, :edit]
  end
end
