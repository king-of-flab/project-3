class RequestsController < ApplicationController

  before_action :authenticate_account!, except: [:index, :show]

  def index
    @search = RequestSearch.new(params[:search])
    @search_requests = @search.scope

    @all_areas = Request.distinct.pluck(:area)
  end

  def create
    new_request = Request.create(request_params)
    new_request.created_by = current_account.id
    # deduct the time credit from creator's account
    current_account.time_credit -= new_request.opening * new_request.unit_time_credit
    current_account.save
    redirect_to request_path(new_request) if new_request.save
  end

  def new
    @new_request = Request.new
  end

  def show
    @current_request = Request.find(params[:id])
    @creator = Account.find(@current_request.created_by)
    @accountsid = []
    if @current_request.accounts.length != 0
      @current_request.accounts.each do |account|
        @accountsid << account.id
      end
    end
  end

  def edit
    @current_request = Request.find(params[:id])
  end

  def update
    updated_request = Request.find(params[:id])
    updated_request.update(request_params)
    redirect_to request_path(updated_request) if updated_request.save
  end

  def destroy
    Request.destroy(params[:id])
    redirect_to my_requests_path
  end

  private

  def request_params
    params.require(:request).permit(:name, :date, :start_time, :end_time, :address, :area, :opening, :unit_time_credit, :description, :image)
  end

end
