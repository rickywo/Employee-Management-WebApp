Rails.application.routes.draw do
  resources :employees
  resources :team_members
  resources :iterations
  resources :projects
  resources :teams
  resources :capitalizable_groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'capitalizable_groups#index'
end
