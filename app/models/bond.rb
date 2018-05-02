class Bond < ApplicationRecord
	has_many :transactions
	has_many :clients, through: :transactions
	has_many :traders, through: :transactions
	has_many :salespersons, through: :transactions
end