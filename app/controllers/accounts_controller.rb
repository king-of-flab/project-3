class AccountsController < ApplicationController

  def requests
    @all_requests = current_account.requests
  end

  def single_request
    @single_request = Request.find(params[:id])
    @creator = Account.find(@single_request.created_by)
    @request_list = @single_request.accounts
  end

  def rewards
    @all_rewards = current_account.rewards
  end

  def single_reward
    @single_reward = Reward.find(params[:id])
    @creator = Account.find(@single_reward.created_by)
    @reward_list = @single_reward.accounts
  end

end
