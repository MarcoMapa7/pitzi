Rails.application.routes.draw do
  resources :setting_apis

  root 'home#index'

# section clients
  get 'home/clients', action: 'clients', controller: 'home'
  post 'home/clients', action: 'send_client_new', controller: 'home'
  put 'home/clients', action: 'send_client_edit', controller: 'home'
  get '/home/edit-client/:id', action: 'client_edit', controller: 'home'
  get '/home/remove-client/:id', action: 'remove_client', controller: 'home'
  get 'home/new-client', action: 'client_new', controller: 'home'

  #section orders
  get 'home/orders', action: 'orders', controller: 'home'
  get '/home/remove-order/:id', action: 'remove_order', controller: 'home'
  get '/home/edit-order/:id', action: 'order_edit', controller: 'home'
  put 'home/orders', action: 'send_order_edit', controller: 'home'
  get 'home/new-order', action: 'order_new', controller: 'home'
  post 'home/orders', action: 'send_order_new', controller: 'home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
