# frozen_string_literal: true

Rails.application.routes.draw do
  resources :initiatives
  root to: 'initiatives#index'
end
