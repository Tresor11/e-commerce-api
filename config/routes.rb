# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items
  resources :favorites,except: %i[destroy]
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'
  put '/edit-profile', to: 'users#update'
  post '/auth/login', to: 'authentication#authenticate'
  delete '/favorites', to: 'favorites#destroy'
end
