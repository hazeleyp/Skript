Rails.application.routes.draw do
  
  resources :scripts do
    resources :steps
  end
  devise_for :users
  root to: "scripts#index"
  
end
