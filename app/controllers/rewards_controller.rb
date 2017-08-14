class RewardsController < ApplicationController

  before_action :authenticate_account!, except: [:index]

  def index
    @all_rewards = Reward.all
    @all_areas = Reward.distinct.pluck(:area)
  end

  def create
      units_required = reward_params["unit_time_credit"].to_i * reward_params["opening"].to_i
      units_balance = current_account["time_credit"].to_i

      if units_balance >= units_required
        new_reward = Reward.create(reward_params)
        new_reward.created_by = current_account.id
        current_account.time_credit -= new_reward.opening * new_reward.unit_time_credit
        current_account.save
        # deduct the time credit from creator's account
        redirect_to reward_path(new_reward) if new_reward.save
      else
        render html: "not enough units to create this event"
      end
    end

  def new
    @new_reward = Reward.new
  end

  def show
    @current_reward = Reward.find(params[:id])
    @creator = Account.find(@current_reward.created_by)
    @accountsid = []
    if @current_reward.accounts.length != 0
      @current_reward.accounts.each do |account|
        @accountsid << account.id
      end
    end
  end

  def edit
    @current_reward = Reward.find(params[:id])
  end

  def update
    updated_reward = Reward.find(params[:id])
    updated_reward.update(reward_params)
    redirect_to reward_path(updated_reward) if updated_reward.save
  end

  def destroy
    Reward.destroy(params[:id])
    redirect_to my_rewards_path
  end

  def redeem
    current_reward = Reward.find(params[:id])
    current_reward.accounts << current_account
    current_reward.opening -= 1
    current_account.time_credit -= current_reward.unit_time_credit
    creator = Account.find(current_reward.created_by)
    creator.time_credit += current_reward.unit_time_credit
    if current_reward.save && current_account.save && creator.save
      redirect_to my_rewards_path
    end
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :date, :start_time, :end_time, :address, :area, :opening, :unit_time_credit, :description, :image)
  end

end
