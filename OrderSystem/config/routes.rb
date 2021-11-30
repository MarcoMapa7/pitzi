Rails.application.routes.draw do
  resources :setting_apis
  root 'home#index'
  get 'home/clients', action: 'clients', controller: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
