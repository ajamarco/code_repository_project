Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do 
  resources :likes, only: [:create, :new, :destroy]
  end


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
 post '/posts/:id' => 'posts#add_comment'
  root 'sessions#home'

end
