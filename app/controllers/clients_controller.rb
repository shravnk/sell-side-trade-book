class ClientsController < ApplicationController

	before_action :current_client, only: [:show, :edit, :update]
  def new
  	@client = Client.new
  end

  def create
    client = Client.create(client_params)
    redirect_to client_path(client)
  end

  def show
  	   @transacts = Transact.where(client_id: params[:id]).not_pending
  end

  def index
  	@items = Client.all
  end

  def edit

  end

  def update
  	@client.update(client_params)
  	redirect_to client_path(@client)
  end



  private

  def client_params
    params.require(:client).permit(
      :name
      )
  end

  def current_client
  	@client = Client.find_by(id: params[:id])
  end
end