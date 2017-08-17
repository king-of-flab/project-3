class AccountsController < ApplicationController

  before_action :authenticate_account!

  def requests
    @requests_created = Request.all.select { |request| request.created_by == current_account.id }.sort { |a,b| a.date <=> b.date }
    @requests_registered = current_account.requests.sort { |a,b| a.date <=> b.date }
    @all_requests = @requests_created + @requests_registered
  end

  def rewards
    @rewards_created = Reward.all.select { |reward| reward.created_by == current_account.id }.sort { |a,b| a.date <=> b.date }
    @rewards_registered = current_account.rewards.sort { |a,b| a.date <=> b.date }
    @all_rewards = @rewards_created + @rewards_registered
  end

end
