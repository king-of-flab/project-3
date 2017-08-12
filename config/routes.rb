Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  devise_for :accounts

  resources :requests

  resources :rewards

  get 'my_requests', to: 'accounts#requests'

  get 'my_rewards', to: 'accounts#rewards'

end
