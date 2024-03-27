Rails.application.routes.draw do
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get 'home', to: 'pages#home'
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    get 'cart', to: 'pages#cart', as: :cart
    get 'checkout', to: 'checkouts#checkout', as: :checkout
    get 'confirm', to: 'checkouts#confirm', as: :confirm
    post 'create-payment-intent', to: 'payments#create_payment_intent'
    resources :sizes
    resources :colors
    resources :variants
    resources :order_items
    resources :orders, only: [:index, :show, :create] do
      get "/pay", to: "payments#pay", as: :pay
    end
    resources :cart_items
    resources :carts, only: [:create, :destroy]
    resources :billing_addresses
    resources :shipping_addresses
    resources :image_urls
    resources :products
    resources :sub_brands
    resources :brands
    resources :sub_categories
    resources :categories
    devise_for :users


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
end
