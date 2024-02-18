
Rails.application.routes.draw do
  resources :companies do
   resources :users
   resources :products
   resources :stocks
  end
    # other resources..
end

