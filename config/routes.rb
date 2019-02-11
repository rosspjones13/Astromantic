Rails.application.routes.draw do
  resources :sessions, only: %i(create)
  resources :astros, only: %i(index show)
  resources :users, except: %i(index)
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
