Rails.application.routes.draw do
  namespace :admin do
      resources :authorities
      resources :routes
      resources :paths
      resources :users
      resources :vehicles
      resources :positions
      resources :tracking_allowances
      resources :roles
      root to: "routes#index"
    end
  #root to: "home#index"
  
  namespace :api do
    scope :routes do
      get '/' => 'routes#index'
      get '/:route_id/vehicles' => 'routes#vehicles'
    end
    
    post '/vehicles' => 'vehicles#create'
    
    scope :trackings do
      post '/:route_id' => 'tracking_allowances#create'
    end
    
    devise_scope :user do
      post 'users/login' => 'sessions#create'
      post 'users/sign_up' => 'registrations#create'
      get 'users/:token' => 'users#show'
    end
  end
  
end
