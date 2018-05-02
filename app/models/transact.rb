class Transact < ApplicationRecord
	belongs_to :bond
	belongs_to :client
	belongs_to :trader
	has_and_belongs_to_many :salespeople

	def trade_type
		if self.we_buy
			"Buy"
		else
			"Sell"
		end
	end
end