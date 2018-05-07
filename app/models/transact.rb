class Transact < ApplicationRecord
	belongs_to :bond
	belongs_to :client
	belongs_to :trader
	# has_and_belongs_to_many :salespeople
	has_many :salesperson_transacts
	has_many :salespeople, through: :salesperson_transacts

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

	def self.not_pending
		where(pending: false)
	end

	def self.pending
		where(pending: true)
	end

	def self.date_sorted
		order(:trade_time).reverse
	end

	def self.includes_salesperson(id)
		@matches = []
		self.all.each do |transact| 
			if transact.salespeople.any?{|sp| sp.id.to_s == id}
				@matches << transact
			end
		end
		@matches
	end
end