class TransactSerializer < ActiveModel::Serializer
  attributes :id, :size, :price, :client, :trader, :trade_type, :next_id, :f_trade_time, :f_updated_at, :f_created_at, :salespeople
  belongs_to :bond

  def trader
  	object.trader.name
  end

  def client
  	object.client.name
  end

  def f_trade_time
  	object.trade_time.strftime('%m-%d-%Y %H:%M:%S')
  end

  def f_updated_at
  	object.updated_at.strftime('%m-%d-%Y %H:%M:%S')
  end

  def f_created_at
  	object.created_at.strftime('%m-%d-%Y %H:%M:%S')
  end
end
