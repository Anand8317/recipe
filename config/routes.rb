Rails.application.routes.draw do
  resources :culinary_recipes do
    member do
      post :add_ingredient
      get :new_ingredient_form
      delete :destroy_ingredient
    end
  end

  resources :inventories, only: [:index, :show, :new, :create, :destroy]
  resources :foods
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/public_recipes', to:'culinary_recipes#public_recipes', as: :public_recipes


  # Defines the root path route ("/")
  root "culinary_recipes#index"
end
