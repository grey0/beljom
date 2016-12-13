Rails.application.routes.draw do
  get 'login'     =>  'sessions#new'

  post 'login'    =>  'sessions#create'

  delete 'login'  =>  'sessions#destroy'

  resources :categories, only: [:index, :show]
  resources :products
  get '/signup'   =>  'sellers#new'
  resources :sellers, only: [:new, :create, :show]

  root 'categories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
