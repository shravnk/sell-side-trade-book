class Salesperson < ApplicationRecord
	has_and_belongs_to_many :transacts 
	# has_many :salespeople_transacts
	# has_many :transacts, through: :salespeople_transacts
	has_many :clients, through: :transacts
end