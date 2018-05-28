class BondsController < ApplicationController

	before_action :current_bond, only: [:show,]

  def show
  	@transacts = Transact.where(bond_id: params[:id]).not_pending
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @bond}
    end
  end

  def index
  	@items = Bond.all
  end

  private

  def current_bond
  	@bond = Bond.find_by(id: params[:id])
  end
end
