class RewardsController < ApplicationController

  def index
  end

  def create
    @new_reward = Reward.create(params.require(:reward).permit!)
    @new_reward.created_by = current_account.id
    redirect_to reward_path(@new_reward) if @new_reward.save
  end

  def new
    @new_reward = Reward.new
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
