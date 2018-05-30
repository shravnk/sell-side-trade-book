class ClientsController < ApplicationController

	before_action :current_client, only: [:show]
  # def new
  # 	@client = Client.new
  # end

  # def create
  #   client = Client.create(client_params)
  #   redirect_to client_path(client)
  # end

  def show
  	@transacts = Transact.where(client_id: params[:id]).not_pending
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @client}
    end
  end

  def index
  	@items = Client.all
  end

  # def update
  # 	@client.update(client_params)
  # 	redirect_to client_path(@client)
  # end

  private

  # def client_params
  #   params.require(:client).permit(
  #     :name
  #     )
  # end

  def current_client
  	@client = Client.find_by(id: params[:id])
  end
end