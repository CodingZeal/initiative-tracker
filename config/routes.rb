# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions" }
  get '/team', to: 'users#team_members'
  resources :users do
    resources :initiatives do
      resources :notes
    end
  end
  resources :initiatives
  root to: 'initiatives#index'
end
