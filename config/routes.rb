Rails.application.routes.draw do
  root to: 'videos#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users, only: [:new , :create]

  resources :videos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end