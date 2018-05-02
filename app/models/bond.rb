class Bond < ApplicationRecord
	has_many :transacts
	has_many :clients, through: :transacts
	has_many :traders, through: :transacts
	has_many :salespeople, through: :transacts
end