# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions" }
  get '/team', to: 'users#team_members'
  # get '/team/:user_id/initiatives', to: 'initiatives#team_members_initiatives', as: 'team_initiatives'
  resources :users do
    resources :initiatives do
      resources :notes
    end
  end
  resources :initiatives
  root to: 'initiatives#index'
end
