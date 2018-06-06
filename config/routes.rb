Rails.application.routes.draw do
  namespace :admin do
      resources :authorities
      resources :routes
      resources :paths
      resources :users
      resources :vehicles
      resources :positions
      resources :tracking_allowances
      
      root to: "routes#index"
    end
  #root to: "home#index"
  
  namespace :api do
    scope :routes do
      get '/' => 'routes#index'
    end
    
    devise_scope :user do
      post 'users/login' => 'sessions#create'
      post 'users/sign_up' => 'registrations#create'
    end
  end
  
end
