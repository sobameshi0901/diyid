Rails.application.routes.draw do
  get 'steps/new'
  get 'materials/new'
  root 'recipes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes, only:[:index, :show, :new, :create] do
    resources :materials, only:[:new, :create]
    resources :steps, only: [:new, :create]
  end
end
