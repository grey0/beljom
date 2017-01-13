Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'admins_dashboard' => 'admins#dashboard'

  get 'login'     =>  'sessions#new'

  post 'login'    =>  'sessions#create'

  delete 'logout'  =>  'sessions#fetch_item'

  get 'admin'     =>  'sessions#new_admin'

  post 'login_admin'    =>  'sessions#create_admin'

  delete 'logout_admin'  =>  'sessions#destroy_admin'

  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :account_activations, only: [:edit]
  resources :categories, only: [:index, :show]
  resources :products do
    resources :images, only: [:create, :destroy]
  end
  get "/fetch_items" => 'images#from_category', as: 'fetch_items'
  get 'product_approve' => 'products#approve'
  get '/signup'   =>  'sellers#new'
  resources :sellers, only: [:new, :create, :show]

  root 'categories#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
