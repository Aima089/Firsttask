Rails.application.routes.draw do
  root 'dashboard#index'

  resources :dashboard, only: [:index] do
    collection do
      get :companies
    end
  end

  resources :companies do
    resources :users do
      collection do
        get 'search'
      end
    end
  end
end
