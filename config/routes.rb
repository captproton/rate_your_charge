require 'sidekiq/web'

Rails.application.routes.draw do
  resources :visits
  resources :listings
  resources :location_reviews
  resources :locations do
    collection do
      post  :search
      get   :second_page
      post  :third_page
      post  :edit
    end
  end

  draw :madmin
  get 'locations/autocomplete', to: 'locations#autocomplete'
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  get '/user_links', to: 'home#user_links'
authenticate :user, lambda { |u| u.admin? } do
  mount Sidekiq::Web => '/sidekiq'

  namespace :madmin do
    resources :impersonates do
      post :impersonate, on: :member
      post :stop_impersonating, on: :collection
    end
  end
end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  scope controller: :static do
    get :about
    get :terms
    get :privacy
    get :pricing
  end

  authenticated :user do
    root to: "dashboard#show", as: :user_root
    # Alternate route to use if logged in users should still see public root
    # get "/dashboard", to: "dashboard#show", as: :user_root
  end

  # Public marketing homepage
  root to: "locations#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
