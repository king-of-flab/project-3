class AccountsController < ApplicationController

  def show
  end

  def requests
    current = current_account
    @all_requests = current.requests
  end

  def rewards
    current = current_account
    @all_rewards = current.rewards
  end

end
