Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#index"
    get "/signin", to: "sessions#new"
    resources :statuses, only: [:create, :update, :edit, :destroy]
    get "/timeline", to: "users#index"
    resources :tours
    resources :users
    resources :posts, only: [:create, :update, :edit, :destroy] do
      resources :comments, except: :index
    end
    resources :conversations do
      resources :messages
    end
    namespace :admin do
      root "homes#index"
    end
  end
end
