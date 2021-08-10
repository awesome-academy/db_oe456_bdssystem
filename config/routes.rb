Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/dashboard", to: "dashboard#index"

    get "/home", to: "static_pages#home"
    get "/lastest", to: "static_pages#lastest"
    get "/blog", to: "static_pages#blog"
    get "/advertising", to: "static_pages#advertising"

    get "/signup", to: "accounts#new"
    post "/signup", to: "users#create"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :accounts
  end
end
