Rails.application.routes.draw do

  root to: "events#index"

  devise_for :users
  
  resources :users
  resources :categories
  resources :locations
  resources :table_of_contents
  resources :quote_versions
  resources :comments
  resources :outlines
  resources :quotes
  resources :sources
  resources :people
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
