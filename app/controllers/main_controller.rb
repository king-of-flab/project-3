class MainController < ApplicationController

  def index
    @four_requests = Request.last(4).reverse
    @four_rewards = Reward.last(4).reverse
  end

end
