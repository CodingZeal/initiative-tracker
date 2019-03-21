# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions" }
  resources :users
  resources :initiatives
  root to: 'initiatives#index'
end
