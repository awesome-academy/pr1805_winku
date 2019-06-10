Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#index"
    get "/signin", to: "sessions#new"
    get "/timeline", to: "users#index"
    resources :statuses, only: [:create, :update, :edit, :destroy]
    resources :tours
    resources :users
    resources :comments
    resources :posts, only: [:create, :update, :edit, :destroy] do
      resources :comments, except: :index
    end
    resources :conversations do
      resources :messages
    end
    namespace :admin do
      root "homes#index"
      resources :statuses, except: [:new, :create, :edit]
      resources :tours, except: [:new, :create, :edit]
    end
  end
end
