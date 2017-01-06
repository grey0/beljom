Rails.application.routes.draw do
  get 'admins_dashboard' => 'admins#dashboard'

  get 'login'     =>  'sessions#new'

  post 'login'    =>  'sessions#create'

  delete 'logout'  =>  'sessions#destroy'

  get 'admin'     =>  'sessions#new_admin'

  post 'login_admin'    =>  'sessions#create_admin'

  delete 'logout_admin'  =>  'sessions#destroy_admin'

  resources :categories, only: [:index, :show]
  resources :products
  get 'product_approve' => 'products#approve'
  get '/signup'   =>  'sellers#new'
  resources :sellers, only: [:new, :create, :show]

  root 'categories#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
