Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'posts#index'
  get '/pages/terms', to:'pages#terms', as:'terms'

  resources :users, only: %i(show) do
    member do
      get :following, :followers
    end
  end

  resources :posts, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
  resources :relationships, only: %i(create destroy)
end
