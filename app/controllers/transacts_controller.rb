class TransactsController < ApplicationController

	before_action :current_transact, only: [:show, :edit, :update]
  def new
  	# @bonds = Bond.all
  	# @salespeople = Salesperson.all
  	# @client = Client.all
  	@transact = Transact.new
  end

  def create
    transact = Transact.create(transact_params)
    # binding.pry
    redirect_to transact_path(transact)
  end

  def show
  	
  end

  def index
  	@transacts = Transact.all
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
       :trade_time
      )
  end

  def current_transact
  	@transact = Transact.find_by(id: params[:id])
  end
end