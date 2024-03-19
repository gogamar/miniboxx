Rails.application.routes.draw do
  resources :sizes
  resources :colors
  resources :variants
  resources :order_items
  resources :orders
  resources :cart_items
  resources :carts
  resources :billing_addresses
  resources :shipping_addresses
  resources :image_urls
  resources :products
  resources :sub_brands
  resources :brands
  resources :sub_categories
  resources :categories
  devise_for :users
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resource :imports, only: [] do
    collection do
      get 'upload_form'
      post 'upload_products'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"
end
