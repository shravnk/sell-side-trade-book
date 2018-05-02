class SalespersonTransaction < ApplicationRecord
	belongs_to :salesperson
	belongs_to :transaction	
end