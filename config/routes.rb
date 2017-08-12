Rails.application.routes.draw do
  get 'accounts/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  devise_for :accounts

  resources :requests do
    resources :accounts, only: [:show], to: 'accounts#show'
  end

  get 'my_requests', to: 'accounts#requests'
  get 'my_requests/:id', to: 'accounts#single_request'

  resources :rewards do
    resources :accounts, only: [:show], to: 'accounts#show'
  end

  get 'my_rewards', to: 'accounts#rewards'
  get 'my_rewards/:id', to: 'accounts#single_reward'

end
