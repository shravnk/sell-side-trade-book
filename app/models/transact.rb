class Transact < ApplicationRecord
	belongs_to :bond
	belongs_to :client
	belongs_to :trader
	has_many :salesperson_transacts
	has_many :salespeople, through: :salesperson_transacts

	validates_inclusion_of :we_buy, in: [true, false]
	validates_presence_of :size, :price, :bond_id, :client_id, :trader_id, :trade_time
	validate :in_past

	validates :size, :price, :numericality => {greater_than: 0}

	def in_past
	    if trade_time.present? && trade_time >= Time.zone.now
	      errors.add(:trade_time, "Trade time must be in the past")
	    end
  	end

	def trade_type
		if self.we_buy
			"Buy"
		else
			"Sell"
		end
	end

	def bond_yield
		Bondie::Issue.new(coupon: self.bond.coupon / 100, maturity_date: self.bond.maturity, coupon_frequency: 2).ytm(self.trade_time.to_date, price: self.price)
	end

	def self.total_volume
		sum("size")
	end

	def self.last_month
		where("trade_time >?", Time.now - 1.months)
	end

	def self.last_quarter
		where("trade_time >?", Time.now - 3.months)
	end

	def self.most_active_by_volume
		group(:bond_id).order('sum_size DESC').sum(:size)
	end

	def self.most_active_by_trades
		group(:bond_id).order('count_id desc').count('id')
	end

	def self.top_clients_by_volume
		group(:client_id).order('sum_size DESC').sum(:size)
	end

	def self.top_clients_by_volume
		group(:client_id).order('sum_size DESC').sum(:size)
	end

	def self.top_traders
		group(:trader_id).order('sum_size DESC').sum(:size)
	end

	def self.top_salespeople
		joins(:salesperson_transacts).group(:salesperson_id).order('sum_size DESC').sum(:size)
	end

	def self.not_pending
		where(pending: false)
	end

	def self.pending
		where(pending: true)
	end

	def self.date_sorted
		order(trade_time: :desc)
	end
	
end