class RewardsController < ApplicationController

  before_action :authenticate_account!, except: [:index]
  before_action :set_reward, except: [:index, :create, :new]

  def index
    @all_areas = Reward.distinct.pluck(:area)
    @all_rewards =
    if params[:area]
      Reward.where("area = '#{params[:area]}'")
    else
      Reward.all
    end
  end

  def create
    units_required = reward_params["unit_time_credit"].to_i * reward_params["opening"].to_i
    units_balance = current_account.time_credit

    if units_balance >= units_required
      new_reward = Reward.create(reward_params)
      new_reward.created_by = current_account.id
      current_account.time_credit -= new_reward.opening * new_reward.unit_time_credit
      current_account.save
      redirect_to reward_path(new_reward) if new_reward.save
    else
      flash[:error] = "Not enough credits to create reward!"
      redirect_to new_reward_path
    end
  end

  def new
    @new_reward = Reward.new
  end

  def show
    @creator = Account.find(@reward.created_by)
    @accountsid = []
    if @reward.accounts.length != 0
      @reward.accounts.each do |account|
        @accountsid << account.id
      end
    end
  end

  def edit
  end

  def update
    @reward.update(update_reward_params)
    redirect_to reward_path if @reward.save
  end

  def destroy
    @reward.destroy
    redirect_to my_rewards_path
  end

  def redeem
    @reward.accounts << current_account
    @reward.opening -= 1
    current_account.time_credit -= @reward.unit_time_credit
    creator = Account.find(@reward.created_by)
    creator.time_credit += @reward.unit_time_credit
    if @reward.save && current_account.save && creator.save
      redirect_to my_rewards_path
    end
  end

  private

  def set_reward
    @reward = Reward.find(params[:id])
  end

  def reward_params
    params.require(:reward).permit(:name, :date, :start_time, :end_time, :address, :area, :opening, :unit_time_credit, :description, :image)
  end

  def update_reward_params
    params.require(:reward).permit(:name, :date, :start_time, :end_time, :address, :area, :description, :image)
  end

end
