Rails.application.routes.draw do
  resources :devices, only: [:index]

  match 'devices/:location/:name' => 'devices#show', :via => :get
  match 'devices/:location/:name' => 'devices#update', :via => :patch 

  post 'authenticate', to: 'authentication#authenticate'

end
