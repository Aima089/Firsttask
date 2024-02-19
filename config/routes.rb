Rails.application.routes.draw do
  resources :companies do
    resources :users
  end
  # other resources...
end

