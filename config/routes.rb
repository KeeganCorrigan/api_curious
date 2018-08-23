Rails.application.routes.draw do

  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  root to: 'sessions#new'

  resources :users, only: [:show] do
    get "/following", to: "users/following#index"
    get "/starred", to: "users/starred#index"
    get "/followers", to: "users/followers#index"
    get "/repos", to: "users/repos#index"
    get "/organizations", to: "users/organizations#index"
  end
end
