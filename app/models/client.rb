class Client < ApplicationRecord
	has_many :transactions
	has_many :bonds, through: :transactions
	has_many :traders, through: :transactions
	has_many :salespersons, through: :transactions
end