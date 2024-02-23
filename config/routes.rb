# config/routes.rb
Rails.application.routes.draw do
  root 'dashboard#index'

  resources :dashboard, only: [:index] do
    collection do
      get :companies
    end
  end

  resources :companies, only: [:index, :new, :create, :show] 

end
