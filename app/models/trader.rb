class Trader < ApplicationRecord
	has_many :transacts
	has_many :bonds, through: :transacts
	has_many :clients, through: :transacts	
	has_many :salespeople, through: :transacts

	
end