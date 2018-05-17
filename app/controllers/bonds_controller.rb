class BondsController < ApplicationController

	before_action :current_bond, only: [:show,]

  def show
  	 @transacts = Transact.where(bond_id: params[:id]).not_pending
  end

  def index
  	@items = Bond.all
  end

  private

  def current_bond
  	@bond = Bond.find_by(id: params[:id])
  end
end
