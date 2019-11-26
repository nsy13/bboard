Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    post 'signup', to: 'devise/registrations#create'
    delete 'delete', to: 'devise/registrations#destroy'
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  resources :users, only: :show
  resources :topics
  resources :posts
  resources :categories, only: :show
end
