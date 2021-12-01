Rails.application.routes.draw do

  # =========================
  # Root
  # =========================
  root to: 'static_pages#index'

  # =========================
  # Devise
  # =========================
  devise_for :organizations
  devise_scope :organization do
    get '/organization_login', to: 'devise/sessions#new'
  end

  devise_for :users
  devise_scope :user do
    get '/user_login', to: 'devise/sessions#new'
    # match '/auth/users/sign_up.user', to: 'registrations#create', via: :post
  end

  # =========================
  # Resources
  # =========================
  resources :organizations
  resources :users

  # =========================
  # Controllers
  # =========================
  # get '/home', to: 'static_pages#index'
  get '/login', to: 'static_pages#login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
