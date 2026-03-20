Rails.application.routes.draw do
  get "/restaurants/:id/menu_items", to: "menu_items#index", as: "restaurant_menu_items"
  post "/restaurants/:id/menu_items", to: "menu_items#create", as: "restaurant_menu_items_create"
  resources :restaurants
  resources :menu_items, only: [ :show, :update, :destroy ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post "login", to: "users#login"

  # Defines the root path route ("/")
  # root "posts#index"
end
