Rails.application.routes.draw do

  # Route config for ActiveAdmin
  ActiveAdmin.routes(self)
  # Route config for Devise controllers
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions", passwords: "passwords"}

  resources :users, path: :members
  # Routes for custom methods (for use with ReactJS)
  post "members/approve", to: "users#approve_user"
  post "members/disapprove", to: "users#disapprove_user"
  post "members/grant_admin", to: "users#grant_admin"
  post "members/revoke_admin", to: "users#revoke_admin"

  devise_scope :user do
    post  "users/regenerate_api_key", to: "registrations#regenerate_api_key"
  end

  resources :organizations

  resources :countries do
    resources :sites
  end

  resources :sites
  # Routes for custom methods (for use with ReactJS)
  post "sites/add_role", to: "sites#add_role"
  post "sites/remove_role", to: "sites#remove_role"

  resources :languages do
    resources :articles
  end

  resources :categories

  resources :articles do
    member do
      post :publish
      post :unpublish
    end
  end

  ## API routes
  namespace :api do
    resources :users
    resources :articles
    resources :countries
    resources :categories
    resources :languages
  end

  # You can have the root of your site routed with "root"
  root 'welcome#index'
end
