# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions" }
  get '/team', to: 'users#team_members'
  resources :users
  resources :initiatives
  resources :team_members do
    resource :initiatives do
      resource :notes
    end
  end
  root to: 'initiatives#index'
end
