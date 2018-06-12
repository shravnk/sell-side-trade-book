class BondsController < ApplicationController

	before_action :current_bond, only: [:show,]

  def show

      @transacts = Transact.where(bond_id: params[:id]).not_pending

  end

  def index
		if params[:trader_id]
			@bonds = Trader.find(params[:trader_id]).bonds.uniq
			render json: @bonds
		else
			@items = Bond.all
		end
  end

  private

  def current_bond
  	@bond = Bond.find_by(id: params[:id])
  end
end
