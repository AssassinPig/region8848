Region8848::Application.routes.draw do
  resources :posts do
    collection do 
      get "add" => 'posts#add'
      post "save" => 'posts#save'
    end
    resources :comments, :only => [:create, :comment_params]
  end

  resources :categories
  get "/sign_out" => 'sessions#destroy'

  get "static_pages/home"  => 'static_pages#home'
  get "static_pages/posts" => 'static_pages#posts'
  get "static_pages/about_me" => 'static_pages#about_me'
  get "static_pages/thanks" => 'static_pages#thanks'

  get "static_pages/admin" => 'static_pages#admin'

 # namespace :admin do
 #   root :to => 'users#home'
 #   post "login" => 'users#login'
 #   resources :users
 #   resources :sessions
 # end

  root 'static_pages#home'
end
