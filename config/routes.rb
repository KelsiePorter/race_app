Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/races', to: 'races#index'
  get '/races/new', to: 'races#new'
  get '/races/:id', to: 'races#show'
  get '/participants', to: 'participants#index'
  get '/participants/:id', to: 'participants#show'
  get '/races/:id/participants', to: 'races_participants#index'
  get '/races/:id/participants/new', to: 'races_participants#new'
  post '/races/:id/participants', to: 'races_participants#create'
  post '/races', to: 'races#create'
  get 'races/:id/edit', to: 'races#edit'
  patch '/races/:id', to: 'races#update'
end
