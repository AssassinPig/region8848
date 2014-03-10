Region8848::Application.routes.draw do
  #resources :sessions
  #resources :users
  resources :posts do
    resources :comments
  end

  resources :categories

  get "/sign_out" => 'sessions#destroy'

  get "static_pages/home"  => 'static_pages#home'
  get "static_pages/posts" => 'static_pages#posts'
  get "static_pages/about_me" => 'static_pages#about_me'
  get "static_pages/thanks" => 'static_pages#thanks'

  post "static_pages/admin" => 'static_pages#admin'

  root 'static_pages#home'

end
