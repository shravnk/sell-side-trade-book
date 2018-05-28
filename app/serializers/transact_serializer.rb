class TransactSerializer < ActiveModel::Serializer
  attributes :id, :size, :price, :client, :trader, :trade_type
  belongs_to :bond

  def trader
  	object.trader.name
  end

  def client
  	object.client.name
  end
end
