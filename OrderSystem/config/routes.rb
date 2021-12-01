Rails.application.routes.draw do
  resources :setting_apis

  root 'home#index'

  get 'home/clients', action: 'clients', controller: 'home'
  post 'home/clients', action: 'send_client_new', controller: 'home'
  put 'home/clients', action: 'send_client_edit', controller: 'home'
  get '/home/edit-client/:id', action: 'client_edit', controller: 'home'
  get '/home/remove-client/:id', action: 'remove_client', controller: 'home'
  get 'home/new-client', action: 'client_new', controller: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
