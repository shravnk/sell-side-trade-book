class BondsController < ApplicationController

	before_action :current_bond, only: [:show,]

  def show
    respond_to do |format|
      @transacts = Transact.where(bond_id: params[:id]).not_pending
      format.html {
        render :show}
      format.json {
        render json: @transacts}
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
