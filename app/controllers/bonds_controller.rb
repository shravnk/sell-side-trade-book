class BondsController < ApplicationController

	before_action :current_bond, only: [:show,]

  def show
  	
    respond_to do |format|
      format.html {
        @transacts = Transact.where(bond_id: params[:id]).not_pending
        render :show}
      format.json {
        @transacts = @transacts.last_month.date_sorted.limit(5)
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
