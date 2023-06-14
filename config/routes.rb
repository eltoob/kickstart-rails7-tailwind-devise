Rails.application.routes.draw do
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  get "/dashboard", to: "home#dashboard"
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       password: "users/password",
                       registrations: "users/registrations",
                       unlocks: "users/unlocks",

                     }
end
