Rails.application.routes.draw do

  root "users#top"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources "users"
  resources "events"
  resources "talks"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
