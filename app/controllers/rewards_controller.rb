class RewardsController < ApplicationController

  before_action :authenticate_account!, except: [:index, :show]

  def index
    @all_rewards = Reward.all
  end

  def create
    new_reward = Reward.create(reward_params)
    new_reward.created_by = current_account.id
    redirect_to reward_path(new_reward) if new_reward.save
  end

  def new
    @new_reward = Reward.new
  end

  def show
    @current_reward = Reward.find(params[:id])
    @creator = Account.find(@current_reward.created_by)
  end

  def edit
    @current_reward = Reward.find(params[:id])
  end

  def update
    updated_reward = Reward.find(params[:id])
    updated_reward.create(reward_params)
    redirect_to reward_path(updated_reward) if updated_reward.save
  end

  def destroy
    Reward.destroy(params[:id])
    redirect_to rewards_path
    # redirect to profile page once profile page is up
    # place the delete button in the profile page
    # <%= button_to "delete", reward_path(@current_reward), method: :delete, class: "btn waves-effect waves-light" %>
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :date, :start_time, :end_time, :address, :area, :opening, :unit_time_credit, :description, :image)
  end

end
