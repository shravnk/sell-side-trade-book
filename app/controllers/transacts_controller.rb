class TransactsController < ApplicationController

	before_action :current_transact, only: [:show, :edit, :update, :confirm, :destroy]
  # include Bondie::Issue
  
  def new
    if params[:bond_id]
      @bond = Bond.find_by(id: params[:bond_id])
    elsif params[:client_id]
      @client = Client.find_by(id: params[:client_id])
    end
  	@transact = Transact.new
  end

  def create
    @transact = Transact.new(transact_params)
    if @transact.valid?
      @transact.save
      redirect_to transact_path(@transact)
    else
      render :new
    end
  end

  def show
  end

  def confirm
    if user_is_trader
      @transact.update(pending: false)
    end
    redirect_to transact_path(@transact)
  end

  def index
    # binding.pry
    if params[:period] == "one_month"
      @transacts = Transact.not_pending.last_month
    else
      @transacts = Transact.not_pending
    end

    if params[:trader_id]
      @transacts = @transacts.where(trader_id: params[:trader_id])
    elsif params[:bond_id]
      @transacts = @transacts.where(bond_id: params[:bond_id])
    elsif params[:client_id]
      @transacts = @transacts.where(client_id: params[:client_id])
    elsif params[:salesperson_id]
      @transacts = @transacts.joins(:salesperson_transacts).where(salesperson_transacts: {salesperson_id: params[:salesperson_id]})
    end

    @transacts = @transacts.date_sorted

  end

  def pending
    if params[:trader_id]
      @transacts = Transact.where(trader_id: params[:trader_id]).pending
    elsif params[:salesperson_id]
      @transacts = Salesperson.find_by(id: params[:salesperson_id]).transacts.pending
    else
      @transacts = Transact.pending
    end
  end

  def edit
    if !user_is_trader
      redirect_to transact_path(@transact)
    end
  end

  def update
  	@transact.update(transact_params)
  	redirect_to transact_path(@transact)
  end

  def destroy
    if user_is_trader || @transact.pending == true
      @transact.destroy
    end
    redirect_to transacts_path
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
       :pending,
       salesperson_ids:[]
      )
  end

  def current_transact
  	@transact = Transact.find_by(id: params[:id])
  end


end