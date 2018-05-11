Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #root to: "home#index"
  
  namespace :api do
    devise_scope :user do
      post 'users/login' => 'sessions#create'
      post 'users/sign_up' => 'registrations#create'
    end
  end
  
end
