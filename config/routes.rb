# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions" }
  get '/team', to: 'users#team_members'
  resources :users
  resources :initiatives
  root to: 'initiatives#index'
end
