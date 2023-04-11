Rails.application.routes.draw do
  root 'landing_pages#index'
  devise_for :users
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
