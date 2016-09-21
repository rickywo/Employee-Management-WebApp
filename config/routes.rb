Rails.application.routes.draw do
  resources :history_data
  resources :capitalization_results
  resources :attendance_types
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  resources :employees
  resources :team_members
  resources :iterations
  resources :projects
  resources :teams
  resources :capitalizable_groups
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#show'
  post 'home/copy_iteration_data'
  post 'home/save_data'
  get '/cap_hour_calculation', to: 'cap_hour_calculation#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post 'capitalizable_groups/update/' => 'capitalizable_groups#update'
  post 'capitalizable_groups/create/' => 'capitalizable_groups#create'
  post 'capitalizable_groups/destroy/' => 'capitalizable_groups#destroy'
  post 'teams/update/' => 'teams#update'
  post 'teams/create/' => 'teams#create'
  post 'teams/destroy/' => 'teams#destroy'
  post 'team_members/update/' => 'team_members#update'
  post 'team_members/create/' => 'team_members#create'
  post 'team_members/destroy/' => 'team_members#destroy'
  post 'projects/update/' => 'projects#update'
  post 'projects/create/' => 'projects#create'
  post 'projects/destroy/' => 'projects#destroy'
  post 'employees/update/' => 'employees#update'
  post 'employees/create/' => 'employees#create'
  post 'employees/destroy/' => 'employees#destroy'
  post 'iterations/update/' => 'iterations#update'
  post 'iterations/create/' => 'iterations#create'
  post 'iterations/destroy/' => 'iterations#destroy'
end
