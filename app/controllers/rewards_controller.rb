class RewardsController < ApplicationController

  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @current_reward = Reward.find(params[:id])
    @creator = Account.find(@current_reward.created_by)
  end

  def update
  end

  def destroy
  end

end
