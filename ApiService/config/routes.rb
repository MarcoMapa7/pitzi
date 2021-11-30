Rails.application.routes.draw do
  devise_for :users
   namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :orders
      resources :clients
      resources :users
    end
  end

  # constraints subdomain: 'api' do
  #   scope module: 'api' do
  #     namespace :v1 do
  #       resources :contacts
  #     end
  #   end
  # end
end
