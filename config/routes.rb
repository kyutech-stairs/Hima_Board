Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  get 'posts/index'

  get 'home/top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resource :posts,          only: [:create, :destroy]
  
  root "posts#index"
  
  get "posts/new" => "posts#new"
  
  post "posts/create" => "posts#create"
  
  get "posts/:id/edit" => "posts#edit"
  
  post "posts/:id/update" => "posts#update"
  
  post "posts/:id/destroy" => "posts#destroy"
  
  get 'posts/:id' => 'posts#show'
  
  get  '/signup',  to: 'users#new'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  resources :relationships,       only: [:create, :destroy]
  
  
end
