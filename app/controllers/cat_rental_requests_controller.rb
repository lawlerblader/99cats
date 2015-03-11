class CatRentalRequestsController < ApplicationController

  def index
    @cat_rental_requests = CatRentalRequest.all
  end

  def show
    @cat_rental_requests = CatRentalRequest.all
    @request = @cat_rental_requests.find(params[:id])
    render :show
  end

  def new
    @request = CatRentalRequest.new
    render :new
  end

  def create
    @request = CatRentalRequest.new(request_params)
    if @request.save
      flash[:notice] = "Scheduled request!"
      redirect_to cat_rental_request_url(@request)
    else
      render :show
    end
  end

  def edit
  end

  def update
    @request = CatRentalRequest.find(params[:cat_id])
  end

  def destroy
  end

  def approve!
    @request = CatRentalRequest.find(params[:id])
    @request.approve!
    redirect_to cat_url(@request.cat)
  end

  def deny!
    @request = CatRentalRequest.find(params[:id])
    @request.deny!
    redirect_to cat_url(@request.cat)
  end

  private
  def request_params
    params[:request].permit(
      :cat_id, :status, :start_date, :end_date
    )
  end

end
