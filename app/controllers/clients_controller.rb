class ClientsController < ApplicationController

	before_action :current_client, only: [:show, :edit, :update]
  def new
  	# @bonds = Bond.all
  	# @salespeople = Salesperson.all
  	# @client = Client.all
  	@client = Client.new
  end

  def create
    client = Client.create(client_params)
    # binding.pry
    redirect_to client_path(client)
  end

  def show
  	
  end

  def index
  	@clients = Client.all
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