Rails.application.routes.draw do

  resources :u
  resources :movies
  resources :reviews

  get '/home' => 'home#index'
  namespace :home do
    resources :reviews
    resources :movies do
      resources :reviews
    end
  end

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  get 'welcome/index'
  root 'welcome#index'
end
