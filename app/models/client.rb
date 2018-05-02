class Client < ApplicationRecord
	has_many :transacts
	has_many :bonds, through: :transacts
	has_many :traders, through: :transacts
	has_many :salespersons, through: :transacts
end