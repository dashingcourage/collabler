# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', 
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  
  get 'pages/terms', to: 'pages#terms', as: 'terms'
  get 'pages/privacypolicy', to: 'pages#privacypolicy', as: 'privacypolicy'
  get 'posts/search', to: 'posts#search', as: 'search'

  resources :users, only: %i[show index] do
    member do
      get :following, :followers
    end
  end

  resource :user, only: %i[edit] do
    collection do
      patch 'update_password'
    end
  end

  resources :posts, only: %i[new create index show destroy] do
    resources :photos, only: %i[create]
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
    resources :bookmarks, only: %i[create destroy]
  end

  resources :relationships, only: %i[create destroy]
  resources :notifications, only: %i[index]
end
