Rails.application.routes.draw do
  root 'pages#main'
  get '/login', to: 'pages#main'
  get '/newMember', to: 'users#new'
  get 'pages/main'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
