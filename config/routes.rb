Rails.application.routes.draw do

  resources :u, only: :show
  resources :movies, only: [:index, :show]
  resources :reviews, only: [:index, :show]

  get '/home' => 'home#index'
  namespace :home do
    resources :reviews, only: :index
    resources :movies do
      resources :reviews, except: :index
    end
  end

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  get 'welcome/index'
  root 'welcome#index'
end
