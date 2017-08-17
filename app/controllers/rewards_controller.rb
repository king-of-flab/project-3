class RewardsController < ApplicationController

  before_action :authenticate_account!, except: [:index]
  before_action :is_organisation?, except: [:index, :show, :redeem]
  before_action :set_reward, except: [:index, :create, :new]

  def index
    @all_areas = Reward.distinct.pluck(:area).sort
    @all_dates = Reward.distinct.pluck(:date).sort
    @all_rewards = Reward.search(params[:area], params[:date]).all.sort { |a,b| a.date <=> b.date }
  end

  def create
    if params[:reward][:date] == ""
      flash[:error] = "Please key in the date of event!"
      redirect_to new_reward_path
    else
      units_required = reward_params["unit_time_credit"].to_i * reward_params["opening"].to_i
      units_balance = current_account.time_credit
      if units_balance >= units_required
        new_reward = Reward.create(reward_params)
        new_reward.created_by = current_account.id
        current_account.time_credit -= new_reward.opening * new_reward.unit_time_credit
        current_account.save
        new_reward.image = "http://res.cloudinary.com/ddanielnp/image/upload/v1502880975/giftloop_events/uni5ivykikxba7sj257n.png" if new_reward.image.blank?
        redirect_to reward_path(new_reward) if new_reward.save
      else
        flash[:error] = "Not enough credits to create reward!"
        redirect_to new_reward_path
      end
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
    if params[:reward][:date] == ""
      flash[:error] = "Please key in the date of event!"
      redirect_to edit_reward_path
    else
      @reward.update(update_reward_params)
      redirect_to reward_path if @reward.save
    end
  end

  def destroy
    @reward.destroy
    redirect_to my_rewards_path
  end

  def redeem
    if current_account.time_credit < @reward.unit_time_credit
      respond_to do |format|
        format.js
      end
    else
      @reward.accounts << current_account
      @reward.opening -= 1
      current_account.time_credit -= @reward.unit_time_credit
      creator = Account.find(@reward.created_by)
      creator.time_credit += @reward.unit_time_credit
      if @reward.save && current_account.save && creator.save
        redirect_to my_rewards_path
      end
    end
  end

  def attendance
    @account_id = params[:account_id]
    @reward.attendance += 1
    @reward.save
    respond_to do |format|
      format.js
    end
  end

  def completed
    @reward.completed = true
    redirect_to my_rewards_path if @reward.save
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

  def is_organisation?
    if current_account.account_type == "individual"
      redirect_to root_path
    end
  end

end
