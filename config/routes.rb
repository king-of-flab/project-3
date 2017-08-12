Rails.application.routes.draw do
  get 'accounts/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  devise_for :accounts

  resources :rewards do
    resources :accounts, only: [:show], to: 'accounts#show'
  end

  resources :'my_rewards', only: [:index], to: 'accounts#rewards'

  resources :requests do
    resources :accounts, only: [:show], to: 'accounts#show'
  end

  resources :'my_requests', only: [:index], to: 'accounts#requests'

end
