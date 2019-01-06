Rails.application.routes.draw do
  get 'courses/new'
  get 'courses/edit'
  get 'courses/index'
  get 'courses/show'
  get 'cohorts/new'
  get 'cohorts/edit'
  get 'cohorts/index'
  get 'cohorts/show'
  root 'pages#main'
  get '/login', to: 'pages#main'
  resources :users
  get '/newMember', to: 'users#new'
  post '/newMember', to: 'users#new'
  get '/users/edit', to: 'users#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
