class RequestsController < ApplicationController

  before_action :authenticate_account!, except: [:index, :show]

  def index
    @all_requests = Request.all
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
    redirect_to requests_path
    # redirect to profile page once profile page is up
    # place the delete button in the profile page
    # <%= button_to "delete", request_path(@current_request), method: :delete, class: "btn waves-effect waves-light" %>
  end

  private

  def request_params
    params.require(:request).permit(:name, :date, :start_time, :end_time, :address, :area, :opening, :unit_time_credit, :description, :image)
  end

end
