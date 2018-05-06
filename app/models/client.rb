class Client < ApplicationRecord
	validates :name, uniqueness: true

	has_many :transacts
	has_many :bonds, through: :transacts
	has_many :traders, through: :transacts
	has_many :salespeople, through: :transacts
end