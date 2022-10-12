Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users
  resources :audits
  resources :demandes, param: :slug do
    member do
      get :download
    end
  end

  get 'pages/welcome'
  get 'admin/index'

  root 'demandes#index'
end
