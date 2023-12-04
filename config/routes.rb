Rails.application.routes.draw do
  get 'bookings/index'
  devise_for :users
  resources :bookings, only: [:index, :update, :edit]
  get '/on_duty', to: "users#on_duty", as: :on_duty
  get '/on_call', to: "users#on_call", as: :on_call
  get '/default', to: "users#default", as: :default
  patch '/users/:id', to: "users#update", as: :deplacement_update

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get '/rooting', to: "pages#rooting", as: :rooting do
    resources :modifications, only: :create
  end

  get '/show', to: "contacts#show", as: :contact

  get '/itinerary', to: "maps#show", as: :map

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end

  resources :notifications, only: :show
end
