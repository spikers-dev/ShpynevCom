Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :destroy]
end
