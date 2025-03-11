Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }


    resources :patients do
      resources :notes, only: [:index, :new, :show, :create, :destroy]
      resources :pathologies, only: [:new, :show, :create, :destroy]
    end
    # ... autres routes ..

  resources :patients
end
