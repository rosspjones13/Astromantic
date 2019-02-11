Rails.application.routes.draw do
  resources :astros, only: %i(index show)
  resources :users, except: %i(index)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
