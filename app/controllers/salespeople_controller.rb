class SalespeopleController < ApplicationController

	before_action :current_salesperson, only: [:show, :edit, :update]
  def new
  	@salesperson = Salesperson.new
  end

  def create
    salesperson = Salesperson.create(salesperson_params)
    redirect_to salesperson_path(salesperson)
  end

  def show
  	@transacts = Transact.joins(:salesperson_transacts).where(salesperson_transacts: {salesperson_id: params[:id]}).not_pending
    
  end


  def index
  	@items = Salesperson.all
  end

  def edit

  end

  def update
  	@salesperson.update(salesperson_params)
  	redirect_to salesperson_path(@salesperson)
  end



  private

  def salesperson_params
    params.require(:salesperson).permit(
      :name
      )
  end

  def current_salesperson
  	@salesperson = Salesperson.find_by(id: params[:id])
  end
end