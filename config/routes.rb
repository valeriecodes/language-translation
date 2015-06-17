Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  # :path_prefix - to customise routes
  # :controllers - to override the devise default - 
  #  - for admin to edit the user table records other than username or password without knowing the password.

  resources :users, path: :members

  devise_scope :user do
    post  "users/regenerate_api_key", to: "registrations#regenerate_api_key"
  end

  resources :installations do
    resources :sites
  end

  resources :sites do
    resources :volunteers
    resources :contributors
  end

  resources :languages do
    resources :articles
  end

  resources :articles

  ## API routes
  namespace :api do
    resources :users
    resources :articles
    resources :installations
  end
 

  # You can have the root of your site routed with "root"
  root 'welcome#index'
end
