class RequestsController < ApplicationController

  before_action :authenticate_account!, except: [:index]
  before_action :set_request, except: [:index, :create, :new]

  def index
    @all_areas = Request.distinct.pluck(:area).sort
    @all_dates = Request.distinct.pluck(:date).sort
    @all_requests = Request.search(params[:area], params[:date]).all.sort { |a,b| a.date <=> b.date }
  end

  def create
    if params[:request][:date] == ""
      flash[:error] = "Please key in the date of event!"
      redirect_to new_request_path
    else
      units_required = request_params["unit_time_credit"].to_i * request_params["opening"].to_i
      units_balance = current_account.time_credit

      if units_balance >= units_required
        new_request = Request.create(request_params)
        new_request.created_by = current_account.id
        current_account.time_credit -= new_request.opening * new_request.unit_time_credit
        current_account.save
        new_request.image = "http://i.imgur.com/O6b9LqP.png" if new_request.image.blank?
        redirect_to request_path(new_request) if new_request.save
      else
        flash[:error] = "Not enough credits to create request!"
        redirect_to new_request_path
      end
    end
  end

  def new
    @new_request = Request.new
  end

  def show
    @creator = Account.find(@request.created_by)
    @accountsid = []
    if @request.accounts.length != 0
      @request.accounts.each do |account|
        @accountsid << account.id
      end
    end
  end

  def edit
  end

  def update
    @request.update(update_request_params)
    redirect_to request_path if @request.save
  end

  def destroy
    @request.destroy
    redirect_to my_requests_path
  end

  def register
    @request.accounts << current_account
    @request.opening -= 1
    redirect_to request_path if @request.save
  end

  def withdraw
    @request.accounts.delete(current_account)
    @request.opening += 1
    redirect_to request_path if @request.save
  end

  def attendance
    @account = @request.accounts.find(params[:account_id])
    @account.time_credit += @request.unit_time_credit
    @account.save
    @request.attendance += 1
    @request.save
    respond_to do |format|
      format.js
    end
  end

  def completed
    @request.completed = true
    @request.save
    @creator = Account.find(@request.created_by)
    vacancy = @request.opening + @request.accounts.count - @request.attendance
    @creator.time_credit += vacancy * @request.unit_time_credit
    @creator.save
    respond_to do |format|
      format.js
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:name, :date, :start_time, :end_time, :address, :area, :opening, :unit_time_credit, :description, :image)
  end

  def update_request_params
    params.require(:request).permit(:name, :date, :start_time, :end_time, :address, :area, :description, :image)
  end

end
