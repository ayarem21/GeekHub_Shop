Rails.application.routes.draw do
  root 'product#index', as: :authenticated_root

  get 'product/index'
  get 'product/show'

  resources :product do
  end

  scope :admin do
    resources :category, controller: 'backoffice/category', as: 'admin_categories'
    resources :product, controller: 'backoffice/product', as: 'admin_products'
  end


  resources :users, only: [:new, :create]
  get '/sign_up', to: 'users#new', as: :sign_up

  resources :sessions, only: [:new, :create, :destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
