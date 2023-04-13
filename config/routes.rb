Rails.application.routes.draw do
  root 'landing_pages#index'
  devise_for :users
  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :money_orders, only: [:index, :show, :new, :create, :destroy]
  end
end
