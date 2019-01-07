Rails.application.routes.draw do
  root 'pages#main'
  post '/login', to: 'users#create'
  delete '/logout', to: 'sessions#delete'
  get 'courses/new'
  get 'courses/edit'
  get 'courses/index'
  get 'courses/show'
  get 'cohorts/new'
  get 'cohorts/edit'
  get 'cohorts/index'
  get 'cohorts/show'
  get '/login', to: 'sessions#new'
  resources :users
  get '/newMember', to: 'users#new'
  post '/newMember', to: 'users#new'
  get '/users/edit', to: 'users#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
