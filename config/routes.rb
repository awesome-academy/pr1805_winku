Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  scope "(:locale)", locale: /en|vi/ do
    root "homes#index"
    get "/signin", to: "sessions#new"
    get "/timeline", to: "static_pages#index"
    resources :statuses, only: [:create, :update, :edit, :destroy]
    resources :tours
    resources :users
    resources :comments, except: :index
    resources :posts, only: [:create, :update, :edit, :destroy] do
      resources :comments, except: :index
    end
    resources :conversations do
      resources :messages
    end
    resources :friendships, only: [:create, :destroy]
    resources :places, only: :show
    resources :businesses, only: [:show, :new, :create]
    resources :likes, only: [:create, :destroy]
    namespace :admin do
      root "homes#index"
      resources :statuses, except: [:new, :create, :edit]
      resources :tours, except: [:new, :create, :edit]
      resources :users, except: [:new, :create, :edit]
      resources :places
    end
  end
end
