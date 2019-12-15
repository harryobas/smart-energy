Rails.application.routes.draw do
  resources :devices, only: [:index, :show, :update]

  post 'authenticate', to: 'authentication#authenticate'

end
