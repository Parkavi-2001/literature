Rails.application.routes.draw do
  
  resources :sessions
  resources :users, except: [:new]
  get 'signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :sessions
  get '/admins', to:'admins#index'
  resources :admins
  #get '/authors', to: 'authors#index'
  #get '/authors/new', to: 'authors#new'
  #delete '/authors/:id', to: 'authors#destroy'
 #get '/authors/:author_id/books/new', to: 'books#new'
  #get '/authors/:author_id/books/:id/edit', to: 'books#edit'
 #resources :books
 resources :authors
 get "/books", to: "books#index"
 resources :authors, only: [:new,:create, :edit, :update, :destroy, :show] do 
   resources :books 
 end
 # resources :authors, only: [:index, :new, :create, :show, :destroy] do
 #   resources:books 
 # end
  get '/lib',to:'authors#literature'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "users#new"
   
end
