class TradersController < ApplicationController

	before_action :current_trader, only: [:show, :edit, :update]
  def new
  	# @bonds = Bond.all
  	# @salespeople = Salesperson.all
  	# @client = Client.all
  	@trader = Trader.new
  end

  def create
    trader = Trader.create(trader_params)
    # binding.pry
    redirect_to trader_path(trader)
  end

  def show
  	
  end

  def view_trades
    @user = Trader.find_by(id: params[:id])
    redirect_to 
  end

  def index
  	@traders = Trader.all
  end

  def edit

  end

  def update
  	@trader.update(trader_params)
  	redirect_to trader_path(@trader)
  end



  private

  def trader_params
    params.require(:trader).permit(
       :we_buy,
       :size,
       :price,
       :bond_id,
       :client_id,
       :trader_id,
       :trade_time
      )
  end

  def current_trader
  	@trader = Trader.find_by(id: params[:id])
  end
end