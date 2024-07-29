Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  get "up" => "rails/health#show", as: :rails_health_check

  delete '/logout', to: 'sessions#destroy'
end
