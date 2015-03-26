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
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  if ENV['ENABLE_DESK'].to_i == 1

    get '/desk' => 'desk/home#index'
    namespace :desk do
      resources :movies
      resources :reviews
      resources :users
      resources :desk_users
    end

    devise_for :desk_users, controllers: {
      sessions: 'desk_users/sessions'
    }

  end

  root 'welcome#index'
end
