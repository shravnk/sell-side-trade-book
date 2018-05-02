class Trader < ApplicationRecord
	has_many :transactions
	has_many :bonds, through: :transactions
	has_many :clients, through: :transactions	
	has_many :salespersons, through: :transactions
end