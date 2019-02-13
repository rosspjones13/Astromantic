Rails.application.routes.draw do
  resources :sessions, only: %i(create)
  resources :astros, only: %i(index show), param: :sign

  resources :users, except: %i(index), param: :username do
    member do
      post 'find_matches'
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
