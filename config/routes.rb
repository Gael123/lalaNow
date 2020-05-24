Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :hotels, only: [:index, :show, :create, :new] do
    resources :room, only: [:show] do
      resources :bookings, only: [:show, :create] do
        resources :payments, only: :new
      end
    end
  end
mount StripeEvent::Engine, at: '/stripe-webhooks'
end
