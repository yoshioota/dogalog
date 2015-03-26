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

  namespace :settings do
    # resource にすると routes は settings_account_pathだけど controller は settings/accounts_controller.rbになる。。
    resource :account
    resource :change_password
    resource :withdrawal
  end

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  get 'welcome/index'
  root 'welcome#index'
end
