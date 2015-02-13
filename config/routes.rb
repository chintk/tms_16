Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
  end
  namespace :suppervisor do
    resources :users
  end
  resources :enrollment_subjects
  resources :enrollment_tasks
end