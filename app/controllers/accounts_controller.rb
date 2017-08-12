class AccountsController < ApplicationController
<<<<<<< HEAD

  def show
  end

  def requests
    current = current_account
    @all_requests = current.requests
  end

  def single_request
    @current = current_account
    @single_request = Request.find(params[:id])
    @creator = Account.find(@single_request.created_by)
    @request_list = @single_request.accounts
  end

  def rewards
    current = current_account
    @all_rewards = current.rewards
  end

  def single_reward
    @current = current_account
    @single_reward = Reward.find(params[:id])
    @creator = Account.find(@single_reward.created_by)
    @reward_list = @single_reward.accounts
  end

=======
  def show
    @current_user = Account.find(params[:id])
  end
>>>>>>> 2080fad9897482a233ab8b0908838daee859f24e
end
