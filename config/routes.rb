Rails.application.routes.draw do
  get 'posts/index'

  get 'home/top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resource :posts
  
  root "posts#index"
  
  get "posts/new" => "posts#new"
  
  post "posts/create" => "posts#create"
  
  get "posts/:id/edit" => "posts#edit"
  
  get 'posts/:id' => 'posts#show'
  
  
end
