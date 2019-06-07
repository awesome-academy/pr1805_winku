Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#index"
    get "/signin", to: "sessions#new"
    get "/timeline", to: "users#index"
    resources :statuses, only: [:create, :update, :edit, :destroy]
    resources :posts, only: [:create, :update, :edit, :destroy] do
      resources :comments, except: :index
    end
    resources :tours
  end
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#index"
    resources :users
    resources :comments, except: :index
    resources :conversations do
      resources :messages
    end
  end
  scope "(:locale)", locale: /en|vi/ do
    namespace :admin do
      root "homes#index"
    end
  end
  scope "(:locale)", locale: /en|vi/ do
    namespace :admin do
      root "homes#index"
    end
  end
end
