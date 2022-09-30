Rails.application.routes.draw do
  get 'admin/index'
  devise_for :users
  resources :users
  resources :demandes
  resources :audits
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "demandes#index"
end
