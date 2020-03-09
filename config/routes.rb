Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  root to: 'pages#home'
  resources :words do
    post :import, on: :collection
    put :remember_update, on: :member
  end
end
