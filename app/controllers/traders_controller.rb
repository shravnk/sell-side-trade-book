class TradersController < ApplicationController

	before_action :current_trader, only: [:show, :edit, :update]

  helper_method :select_trader
  def new
  	# @bonds = Bond.all
  	# @salespeople = Salesperson.all
  	# @client = Client.all
  	@trader = Trader.new
  end

  def create
    trader = Trader.create(trader_params)
    binding.pry
    redirect_to trader_path(trader)
  end

  def show
  	
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

  def current_trader
  	@trader = Trader.find_by(id: params[:id])
  end

  def select_trader
    try(Trader.find_by(username: current_user.username).id))
  end
end