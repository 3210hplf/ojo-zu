Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :profiles, only: %i[new create edit update]
  resources :children, only: %i[new create edit update]
  resources :posts do
    resources :comments, only: %i[create update show destroy], shallow: true
    resources :stamps, only: %i[create destroy], shallow: true
  end
  resources :families, only: %i[index]
  resources :others, only: %i[index]
end
