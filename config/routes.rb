Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations", invitations: "invitations" }

  resources :users, path: :members
  post "members/approve", to: "users#approve_user"
  post "members/disapprove", to: "users#disapprove_user"
  post "members/grant_admin", to: "users#grant_admin"
  post "members/revoke_admin", to: "users#revoke_admin"

  devise_scope :user do
    post  "users/regenerate_api_key", to: "registrations#regenerate_api_key"
  end

  resources :organizations

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
    resources :installations
    resources :categories
    resources :languages
  end
 

  # You can have the root of your site routed with "root"
  root 'welcome#index'
end
