class RequestsController < ApplicationController

  before_action :authenticate_account!, except: [:index]

  def index
    # if params[:search] == nil
    #   @all_requests = Request.all
    # else
      @search = RequestSearch.new(params[:search])
      @all_requests = @search.scope

    @all_areas = Request.distinct.pluck(:area)
  end

  def create
      units_required = request_params["unit_time_credit"].to_i * request_params["opening"].to_i
      units_balance = current_account["time_credit"].to_i

      if units_balance >= units_required
        new_request = Request.create(request_params)
        new_request.created_by = current_account.id
        # deduct the time credit from creator's account
        current_account.time_credit -= new_request.opening * new_request.unit_time_credit
        current_account.save
        redirect_to request_path(new_request) if new_request.save
      else
        render html: "not enough to create this event"
      end
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

  def register
    current_request = Request.find(params[:id])
    current_request.accounts << current_account
    current_request.opening -= 1
    redirect_to request_path if current_request.save
  end

  def withdraw
    request = Request.find(params[:id])
    request.accounts.delete(current_account[:id])
    request.opening += 1
    redirect_to request_path if request.save
  end

  def withdraw
    request = Request.find(params[:id])
    # account = request.accounts.find(current_account[:id])
    request.accounts.delete(current_account[:id])

    redirect_to request_path

  end


  private

  def request_params
    params.require(:request).permit(:name, :date, :start_time, :end_time, :address, :area, :opening, :unit_time_credit, :description, :image)
  end

end
