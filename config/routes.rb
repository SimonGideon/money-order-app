Rails.application.routes.draw do
  devise_for :users
  root 'landing_pages#index'
end
