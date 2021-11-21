Rails.application.routes.draw do


  # =========================
  # Root
  # =========================
  root to: 'static_pages#index'

  # =========================
  # Devise
  # =========================
  devise_for :users
  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    # match '/auth/users/sign_up.user', to: 'registrations#create', via: :post
  end

  # =========================
  # Resources
  # =========================
  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
