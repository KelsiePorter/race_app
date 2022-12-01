Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/races', to: 'races#index'
  get '/races/:id', to: 'races#show'
  get '/participants', to: 'participants#index'
  get '/participants/:id', to: 'participants#show'
end
