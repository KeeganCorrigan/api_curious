Rails.application.routes.draw do

  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#new'

  resources :users, only: [:show] do
    get "/followers", to: "users/followers#index"
    get "/following", to: "users/following#index"
  end
end
