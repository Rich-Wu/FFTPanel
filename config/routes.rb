Rails.application.routes.draw do
  root 'pages#main'
  get '/login', to: 'sessions#new' #login page
  post '/login', to: 'sessions#create' #login action
  delete '/logout', to: 'sessions#delete' #logout action
  get '/newMember', to: 'users#new' #Create User page
  post '/newMember', to: 'users#create' #Create User action
  get '/myInfo', to: 'users#edit' #Update User page
  patch '/myInfo', to: 'users#update' #Update User action
  get '/users', to: 'users#index' #Read Users Page
  get '/user/:id', to: 'users#show', as: :user #Read User_id page
  get 'courses/new'
  get 'courses/edit'
  get 'courses/index'
  get 'courses/show'
  get 'cohorts/new'
  get 'cohorts/edit'
  get 'cohorts/index'
  get 'cohorts/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
