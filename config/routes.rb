Rails.application.routes.draw do
  get 'steps/new'
  get 'materials/new'
  root 'recipes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes
end
