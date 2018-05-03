class Transact < ApplicationRecord
	belongs_to :bond
	belongs_to :client
	belongs_to :trader
	has_and_belongs_to_many :salespeople
	# has_many :salespeople_transacts
	# has_many :salespeople, through: :salespeople_transacts

	validates_inclusion_of :we_buy, in: [true, false]
	validates_presence_of :size, :price, :bond_id, :client_id, :trader_id, :trade_time

	validates :size, :price, :numericality => {greater_than: 0}


	def trade_type
		if self.we_buy
			"Buy"
		else
			"Sell"
		end
	end

	

	def self.includes_salesperson(id)
		@matches = []
		self.all.each do |transact| 
			# binding.pry
			if transact.salespeople.any?{|sp| sp.id.to_s == id}
				@matches << transact
				# binding.pry
			end
		end
		@matches
	end
end