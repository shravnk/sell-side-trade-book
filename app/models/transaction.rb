class Transaction < ApplicationRecord
	belongs_to :bond
	belongs_to :client
	belongs_to :trader
	has_and_belongs_to_many :salespersons
end