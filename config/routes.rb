Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/home", to: "static_pages#home"
    get "/lastest", to: "static_pages#lastest"
    get "/blog", to: "static_pages#blog"
    get "/advertising", to: "static_pages#advertising"
  end
end
