Rails.application.routes.draw do
  get 'pages/welcome'
  get 'admin/index'
  devise_for :users
  resources :users
  resources :demandes do
    member do
      get :download
    end
  end
  resources :audits
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "demandes#index"
end
