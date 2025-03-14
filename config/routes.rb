Rails.application.routes.draw do
  root to: "appointments#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :appointments

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :patients do
    resources :notes
    resources :pathologies
    member do
      post :upload_ordonnance
      delete :destroy_ordonnance
    end
  end

  get "profile" => "users#profile"
  resources :reports
end
