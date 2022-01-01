# == Route Map
#

# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'

  # get 'home/index'rails
  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users, only: [:create] do
    resource :password, controller: 'clearance/passwords', only: %i[edit update]
  end

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'clearance/users#new', as: 'sign_up'

  resources :clubs, only: %i[create new show] do
    resources :read_sessions, only: %i[create new show], shallow: true do
      resources :submissions, only: %i[create]
      get '/join' => 'submissions#new'
    end
  end

  resources :google_books, only: :index

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
