class AccountsController < ApplicationController
  def show
    @current_user = Account.find(params[:id])
  end
end
