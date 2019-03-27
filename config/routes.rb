# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions" }
  get '/users/team_members', to: 'users#team_members', as: 'team'
  resources :users
  resources :initiatives
  root to: 'initiatives#index'
end
