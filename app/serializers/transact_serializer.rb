class TransactSerializer < ActiveModel::Serializer
  attributes :id, :size, :price, :client, :trader, :trade_type, :next_id, :trade_time, :updated_at, :created_at, :salespeople
  belongs_to :bond

  def trader
  	object.trader.name
  end

  def client
  	object.client.name
  end
end
