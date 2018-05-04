class SalespeopleController < ApplicationController

	before_action :current_salesperson, only: [:show, :edit, :update]
  def new
  	# @bonds = Bond.all
  	# @salespeople = Salesperson.all
  	# @client = Client.all
  	@salesperson = Salesperson.new
  end

  def create
    salesperson = Salesperson.create(salesperson_params)
    # binding.pry
    redirect_to salesperson_path(salesperson)
  end

  def show
  	
  end


  def index
  	@salespeople = Salesperson.all
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