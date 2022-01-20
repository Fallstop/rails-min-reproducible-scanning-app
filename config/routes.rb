Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/xyz/", to: "xyz#index"
  get "/xyz/*all", to: "xyz#index"
end
