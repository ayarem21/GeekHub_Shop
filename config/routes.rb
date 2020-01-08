Rails.application.routes.draw do
  root 'product#index', as: :authenticated_root

  get 'product/index'
  get 'product/show'

  resources :product

  scope :admin do
    resources :category, controller: 'backoffice/category', as: 'admin_categories'
    resources :product, controller: 'backoffice/product', as: 'admin_products' do
      resources :images, only: %i[create destroy]
    end
  end


  resources :users, only: %i[new create]
  get '/sign_up', to: 'users#new', as: :sign_up

  resources :sessions, only: %i[new create destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out
end
