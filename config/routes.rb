Rails.application.routes.draw do
  root 'landing_pages#index'
  get 'landingpage', to: 'landing_pages#index', as: 'landingpage'
  resources :landing_pages, only: [:index]
  resources :groups, only: [:index, :new, :create, :update, :destroy] do
    resources :money_orders, only: [:index, :show, :new, :create, :destroy]
  end
  devise_for :users
end
