class RequestsController < ApplicationController

  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @current_request = Request.find(params[:id])
    @creator = Account.find(@current_request.created_by)
  end

  def update
  end

  def destroy
  end

end
