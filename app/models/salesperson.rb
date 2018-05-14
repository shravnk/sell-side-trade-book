class Salesperson < ApplicationRecord
	has_many :salesperson_transacts
	has_many :transacts, through: :salesperson_transacts
	has_many :clients, through: :transacts

	validates :username, uniqueness: true, :allow_nil => true
end