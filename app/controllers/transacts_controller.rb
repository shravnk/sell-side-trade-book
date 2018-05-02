class TransactsController < ApplicationController

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
  	@transact = Transact.find_by(id: params[:id])
  end

  def index
  	@transacts = Transact.all
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
end