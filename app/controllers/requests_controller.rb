class RequestsController < ApplicationController

  def index
    @all_requests = Request.all
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

  def show
    @current_request = Request.find(params[:id])
    @creator = Account.find(@current_request.created_by)
  end

  def edit
    @current_request = Request.find(params[:id])
  end

  def update
    updated_request = Request.find(params[:id])
    updated_request.update(request_update_params)
    redirect_to request_path(updated_request) if updated_request.save
  end

  def destroy
  end

  private

  def request_update_params
    params.require(:request).permit(:name, :date, :start_time, :end_time, :address, :area, :opening, :unit_time_credit, :description, :image)
  end

end
