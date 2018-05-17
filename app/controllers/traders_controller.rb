class TradersController < ApplicationController

	before_action :current_trader, only: [:show]

 
  def new
  	@trader = Trader.new
  end

  def create
    trader = Trader.create(trader_params)
    redirect_to trader_path(trader)
  end

  def show
  	@transacts = Transact.where(trader_id: params[:id]).not_pending
  end


  def index
  	@items = Trader.all
  end

  private

  def current_trader
  	@trader = Trader.find_by(id: params[:id])
  end


end