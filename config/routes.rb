Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" }

  # :path_prefix - to customise routes
  # :controllers - to override the devise default - 
  #  - for admin to edit the user table records other than username or password without knowing the password.

  resources :users, path: :members
  post "members/approve", to: "users#approve_user"
  post "members/disapprove", to: "users#disapprove_user"

  devise_scope :user do
    post  "users/regenerate_api_key", to: "registrations#regenerate_api_key"
  end

  resources :installations do
    resources :sites
  end

  resources :sites
  post "sites/add_role", to: "sites#add_role"
  post "sites/remove_role", to: "sites#remove_role"

  resources :languages do
    resources :articles
  end

  resources :categories

  resources :articles

  ## API routes
  namespace :api do
    resources :users
    resources :articles
    resources :installations
    resources :categories
    resources :languages
  end
 

  # You can have the root of your site routed with "root"
  root 'welcome#index'
end
