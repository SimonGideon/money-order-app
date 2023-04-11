Rails.application.routes.draw do
  root 'landing_pages#index'
  devise_for :users
end
