Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts, only: %i[index new create show edit update]
  resources :dashboards, only: %i[index]
  resources :logins, only: %i[new create destroy]
  resources :registrations, only: %i[new create]

  get "/first", to: "site#first", as: :first_page
  get "/second", to: "site#second", as: :second_page
  post "/third", to: "site#third", as: :third_page
  get "/fourth", to: "site#fourth", as: :fourth_page

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "dashboards#index"
end
