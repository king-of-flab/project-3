class AccountsController < ApplicationController

  def requests
    all_requests = Request.all
    @requests_created = all_requests.select { |request| request.created_by == current_account.id }
    @requests_registered = current_account.requests
  end

  def rewards
    all_rewards = Reward.all
    @rewards_created = all_rewards.select { |reward| reward.created_by == current_account.id }
    @rewards_registered = current_account.rewards
  end

end
