class TransactSerializer < ActiveModel::Serializer
  attributes :id, :we_buy, :size, :price, :client_id, :trader_id
  belongs_to :bond
end
