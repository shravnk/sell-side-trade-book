class Bond < ApplicationRecord
	has_many :transacts
	has_many :clients, through: :transacts
	has_many :traders, through: :transacts
	has_many :salespeople, through: :transacts

	def print_description
		"#{self.ticker} #{self.coupon.to_s}% #{self.maturity.year}"
	end

	def add_to_coupon
		self.coupon + 1
	end
	
end