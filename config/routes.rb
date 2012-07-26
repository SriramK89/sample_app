SampleApp::Application.routes.draw do
  get "comments/create"

  root to: "static_pages#home"

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy, :show]
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create]

  match "/signup", to: "users#new"
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match "/help", to: "static_pages#help"
  match "/about", to: "static_pages#about"
  match "/contact", to: "static_pages#contact"
end
