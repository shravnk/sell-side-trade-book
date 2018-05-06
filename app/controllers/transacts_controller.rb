class TransactsController < ApplicationController

	before_action :current_transact, only: [:show, :edit, :update]
  
  def new
  	# @bonds = Bond.all
  	# @salespeople = Salesperson.all
  	# @client = Client.all
    redirect_to transacts_path unless user_is_trader
  	@transact = Transact.new
    @current_user = current_user
  end

  def create
    @transact = Transact.new(transact_params)
    
    if @transact.valid?
      # binding.pry
      @transact.save
      redirect_to transact_path(@transact)
    else
      render :new
    end
  end

  def show
  	
  end

  def index
    if params[:trader_id]
      @transacts = Transact.where(trader_id: params[:trader_id])
    elsif params[:client_id]
      @transacts = Transact.where(client_id: params[:client_id])
    elsif params[:salesperson_id]
      @transacts = Salesperson.find_by(id: params[:salesperson_id]).transacts
    else 
    	@transacts = Transact.all
    end
  end

  def edit

  end

  def update
  	@transact.update(transact_params)
  	redirect_to transact_path(@transact)
  end



  private

  def transact_params
    params.require(:transact).permit(
       :we_buy,
       :size,
       :price,
       :bond_id,
       :client_id,
       :trader_id,
       :trade_time,
       salesperson_ids:[]
      )
  end

  def current_transact
  	@transact = Transact.find_by(id: params[:id])
  end


end