Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'

  resources :registrations, only: %i(new create)
  resources :sessions, only: %i(new create) do
    delete :destroy, on: :collection
  end
end
