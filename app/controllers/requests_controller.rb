class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def create
    @new_request = Request.create(params.require(:request).permit!)
    @new_request.created_by = current_account.id
    current_account.time_credit -= @new_request.opening * @new_request.unit_time_credit
    current_account.save
    redirect_to request_path(@new_request) if @new_request.save
  end

  def new
    @new_request = Request.new
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
