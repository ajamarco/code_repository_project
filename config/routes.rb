Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do 
    resources :likes, only: [:create, :new, :destroy]
  end

  root 'sessions#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/posts/:id' => 'posts#add_comment'
  post '/search/posts' => 'searchs#search_posts'
  post '/search/user_posts' => 'searchs#search_posts_within_user'

end
