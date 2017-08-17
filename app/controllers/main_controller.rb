class MainController < ApplicationController

  def index
    @four_requests = Request.select{ |request| !request.completed }.last(4).reverse
    @four_rewards = Reward.select{ |reward| !reward.completed }.last(4).reverse
  end

end
