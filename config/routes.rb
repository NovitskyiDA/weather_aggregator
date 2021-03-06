Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'

  resources :registrations, only: %i[new create] do
    member do
      get :confirm_email
    end
  end

  resources :sessions, only: %i[new create] do
    delete :destroy, on: :collection
  end

  resources :password_resets, except: %i[index destroy]

  resources :locations, only: %i[index create destroy]

  resources :weather_informations, only: %i[show update]

  resources :contacts, only: %i[new create]

  resources :locales, only: :update, constraints: { id: /(en|ua)/ }
end
