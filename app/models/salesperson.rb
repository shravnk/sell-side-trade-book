class Salesperson < ApplicationRecord
	self.primary_key = :id

	has_many :salesperson_transacts
	has_many :transacts, through: :salesperson_transacts
	has_many :clients, through: :transacts

	validates :username, uniqueness: true, :allow_nil => true

	def self.select_current
		where("username = ?", "sarah_jones")
	end

end