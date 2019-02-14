Rails.application.routes.draw do
  root 'sessions#home'
  
  resources :sessions, only: %i(create)
  resources :astros, only: %i(index show), param: :sign

  resources :users, except: %i(index), param: :username do
    member { post 'find_matches' }
    collection { get 'search' }
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
