Region8848::Application.routes.draw do
  root 'static_pages#home'
  get "static_pages/home"  => 'static_pages#home'
  get "static_pages/posts" => 'static_pages#posts'
  get "static_pages/about_me" => 'static_pages#about_me'
  get "static_pages/thanks" => 'static_pages#thanks'

  resources :posts, :only => [:index, :show]
  resources :categories, :only => [:index, :show]

  resources :posts do
    resources :comments, :only => [:create, :comment_params]
  end

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
