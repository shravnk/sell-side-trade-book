class Salesperson < ApplicationRecord
	has_and_belongs_to_many :transactions
	has_many :clients, through: :transactions
end