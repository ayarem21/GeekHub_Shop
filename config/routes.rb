Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'product#index'

    get 'product/index'
    get 'product/show'
    get 'product/about'

    get 'carts/:id' => 'carts#show', as: 'cart'
    delete 'carts/:id' => 'carts#destroy'

    post 'cart_items/:id/add' => 'cart_items#add_quantity', as: 'cart_item_add'
    post 'cart_items/:id/reduce' => 'cart_items#reduce_quantity', as: 'cart_item_reduce'
    post 'cart_items' => 'cart_items#create'
    get 'cart_items/:id' => 'cart_items#show', as: 'cart_item'
    delete 'cart_items/:id' => 'cart_items#destroy'

    resources :orders

    resources :product do
      resources :comments
      collection do
        get :min_price
        get :max_price
        get :new_sort
        get :by_category
      end
      resources :images, controller: 'backoffice/images'
    end

    scope :admin do
      resources :category, controller: 'backoffice/category', as: 'admin_categories'
      resources :product, controller: 'backoffice/product', as: 'admin_products'
      resources :orders, controller: 'backoffice/orders', as: 'admin_orders'
    end


    resources :users, only: %i[new create]
    get '/sign_up', to: 'users#new', as: :sign_up

    resources :sessions, only: %i[new create destroy]
    get '/log_in', to: 'sessions#new', as: :log_in
    delete '/log_out', to: 'sessions#destroy', as: :log_out
  end
end
