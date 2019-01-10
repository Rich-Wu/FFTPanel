Rails.application.routes.draw do
  root 'pages#main'
  get '/index', to: 'pages#index'
  get '/login', to: 'sessions#new' #login page
  post '/login', to: 'sessions#create' #login action
  delete '/logout', to: 'sessions#delete' #logout action
  get '/newMember', to: 'users#new' #Create User page
  post '/newMember', to: 'users#create' #Create User action
  get '/myInfo', to: 'users#update' #Update User page
  patch '/myInfo', to: 'users#update' #Update User action
  get '/instructors', to: 'users#instructors' #Read Users (filter: instructors) Page
  get '/students', to: 'users#students' #Read Users (filter: students) Page
  get '/users', to: 'users#index' #Read Users Page
  get '/user/:id/edit', to: 'users#edit', as: :user_edit #Update other users route
  patch '/user/:id/edit', to: 'users#edit' #Update User action
  get '/user/:id', to: 'users#show', as: :user #Read User_id page
  delete '/user/:id', to: 'users#destroy' #Destroy User action
  get 'cohorts/new' #Create Cohort page
  post 'cohorts/new', to: 'cohorts#create' #Create Cohort action
  get 'cohort/:id/edit', to: 'cohorts#edit', as: :cohort_edit #Read Cohort edit page
  patch 'cohort/:id/edit', to: 'cohorts#update'
  get 'cohort/:id', to: 'cohorts#show', as: :cohort #Read Cohort page
  delete 'cohort/:id', to: 'cohorts#destroy' #Destroy cohort action
  get '/cohorts', to: 'cohorts#index' #Read Cohorts page
  get 'cohorts/edit' #Update Cohort page
  get 'courses/new'
  get 'courses/edit'
  get '/courses', to: 'courses#index'
  get 'courses/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
