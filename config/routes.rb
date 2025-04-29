Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :users do
    member do
      get "start_verification"
      post "verify"
    end
  end
  resources :answers
  resources :payments
  resources :questions
  resources :categories

  get "home_question/:id" => "home#question", as: :home_question

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
