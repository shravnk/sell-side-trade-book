pemex26 = Bond.create(isin: "US71654QBW15", ticker: "PEMEX", coupon: 4.5, maturity: "2026-01-23")

blackrock = Client.create(name: "BlackRock")

brendan = Trader.create(name: "Brendan")

joe = Salesperson.create(name: "Joe")

t = Transact.create(we_buy: true, size: 1000, price: 100, client_id: 1, trader_id: 1, trade_time: Time.now, bond_id: 1)
