Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "static_pages#index"
    get "/signin", to: "sessions#new"
    get "/timeline", to: "users#index"
    resources :posts, only: :create
  end
end
