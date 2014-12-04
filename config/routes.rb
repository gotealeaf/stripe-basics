Rails.application.routes.draw do
  resources :registrations

  post "registrations/hook"

  resources :courses

  root "courses#index"
end
