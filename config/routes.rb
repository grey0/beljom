Rails.application.routes.draw do
  resources :categories
  resource :category

  get 'products/create'

  get 'products/new'

  get 'products/index'

  get 'sellers/create'

  get 'sellers/new'

  get 'sellers/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
