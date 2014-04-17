Region8848::Application.routes.draw do
  root 'static_pages#home'
  get "shop"  => 'static_pages#shop'
  get "forum"  => 'categories#index'
  get "static_pages/home"  => 'static_pages#home'
  get "static_pages/posts" => 'static_pages#posts'
  get "static_pages/about_me" => 'static_pages#about_me'
  get "static_pages/thanks" => 'static_pages#thanks'

  resources :posts
  resources :categories, :only => [:index, :show]

  resources :posts do
    resources :comments, :only => [:create]
  end

  resources :users, :only => [:new, :create, :show, :index, :edit, :update]
  resources :sessions, :only => [:new, :create, :destroy] 
  get "signup" => 'users#new'
  get "login" => 'sessions#new'
  post "login" => 'sessions#create'
  delete "logout" => 'sessions#destroy'

  namespace :admin do
    resources :sessions, :only => [:new, :create, :destroy] 

    get "login" => 'sessions#new'
    post "login" => 'sessions#create'
    delete "logout" => 'sessions#destroy'
    root :to => 'static_pages#home'

    resources :posts
    resources :categories
  end

end
