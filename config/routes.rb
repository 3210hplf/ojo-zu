Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :profiles, only: %i[new create]
  resources :children, only: %i[new create]
  resources :posts
  resources :families, only: %i[index]
end
