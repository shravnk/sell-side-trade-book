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
      if params[:id]
        redirect_to transact_path(@transact)
      else
        render json: @transact, status: 201
      end
    else
      render :new
    end
  end

  def show
    @next_id = @transact.next_id
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @transact}
    end
  end

  def confirm
    if user_is_trader
      @transact.update(pending: false)
    end
    redirect_to transact_path(@transact)
  end

  def index
    @transacts = get_period_transacts

    if params[:trader_id]
      @entity = Trader.find(params[:trader_id])
      @transacts = @transacts.where(trader_id: params[:trader_id])
    elsif params[:bond_id]
      @bond = Bond.find(params[:bond_id])
      @transacts = @transacts.where(bond_id: params[:bond_id])
    elsif params[:client_id]
      @entity = Client.find(params[:client_id])
      @transacts = @transacts.where(client_id: params[:client_id])
      respond_to do |format|
        format.html {
          render :index}
        format.json {
          @transacts = @transacts.date_sorted.limit(5)
          render json: @transacts}
      end
    elsif params[:salesperson_id]
      @entity = Salesperson.find(params[:salesperson_id])
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

  def get_period_transacts
    if params[:period] == "one_month"
      Transact.not_pending.last_month
    elsif params[:period] == "one_quarter"
      Transact.not_pending.last_quarter        
    else
      Transact.not_pending
    end
  end


end