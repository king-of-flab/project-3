Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations'
  }

  resources :requests

  resources :rewards

  get 'my_requests', to: 'accounts#requests'

  get 'my_rewards', to: 'accounts#rewards'

  post 'requests/:id/register', to: 'requests#register', as: 'register_request'

  delete 'requests/:id/withdraw', to: 'requests#withdraw', as: 'withdraw_request'

  post 'requests/:id/attendance', to: 'requests#attendance', as: 'attendance'

  post 'requests/:id/completed', to: 'requests#completed', as: 'completed'

  post 'rewards/:id/redeem', to: 'rewards#redeem', as: 'redeem_reward'

end
