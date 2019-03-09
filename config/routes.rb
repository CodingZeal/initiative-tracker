Rails.application.routes.draw do
  #devise_for :users
  resources :initiatives
  root to: 'initiatives#index'
end
