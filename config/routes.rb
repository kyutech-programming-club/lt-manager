Rails.application.routes.draw do


  get 'talks/show'
  root "users#top"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources "users"
  resources "events"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
