class SalespersonTransact < ApplicationRecord
	belongs_to :salesperson
	belongs_to :transact
end