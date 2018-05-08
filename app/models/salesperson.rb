class Salesperson < ApplicationRecord
	# has_and_belongs_to_many :transacts 
	has_many :salesperson_transacts
	has_many :transacts, through: :salesperson_transacts
	has_many :clients, through: :transacts

	validates :username, uniqueness: true
end