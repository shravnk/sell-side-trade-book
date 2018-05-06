# pemex26 = Bond.create(isin: "US71654QBW15", ticker: "PEMEX", coupon: 4.5, maturity: "2026-01-23")
# brazil26 = Bond.create(isin: "US105756BX78", ticker: "BRAZIL", coupon: 6.0 , maturity: "202604-07")
# Bond.create(isin: "US91086QBG29", ticker: "MEX", coupon: 4.125 , maturity: "2026-04-07")
# Bond.create(isin: "US195325CX13", ticker: "COLOM", coupon: 4.5 , maturity: "2026-01-28")
# Bond.create(isin: "US71647NAQ25", ticker: "PETBRA", coupon: 8.75 , maturity: "2026-05-23")
# Bond.create(isin: "USG5825AAB82", ticker: "MRFGBZ", coupon: 6.875 , maturity: "2025-01-19")
# Bond.create(isin: "USL6401PAF01", ticker: "BEEFBZ", coupon: 6.5 , maturity: "2026-09-20")


# Client.create(name: "BlackRock")
# Client.create(name: "T Rowe Price")
# Client.create(name: "Vanguard")
# Client.create(name: "Prudential")
# Client.create(name: "Capital Research")

# Trader.create(name: "Freddy Fennell")
# Trader.create(name: "Hugo Saba")
# Trader.create(name: "Melinda Prevatte")
# Trader.create(name: "Guillermina Escudero")

# Salesperson.create(name: "Walton Mejorado")
# Salesperson.create(name: "Quincy Slawson")
# Salesperson.create(name: "Waltraud Daniel")
# Salesperson.create(name: "Jolyn Tagg")
# Salesperson.create(name: "Nadene Shirkey")


Transact.create(we_buy: true, size: 1000, price: 100, bond_id: 1, client_id: 2, trader_id: 1, trade_time: "2018-01-03 07:30:00")
Transact.create(we_buy: false, size: 1000, price: 98.5, bond_id: 1, client_id: 3, trader_id: 1, trade_time: "2018-03-03 09:30:00")
Transact.create(we_buy: true, size: 750, price: 96.5, bond_id: 1, client_id: 5, trader_id: 1, trade_time: "2018-01-21 07:30:00")

Transact.create(we_buy: false, size: 6000, price: 86.5, bond_id: 2, client_id: 1, trader_id: 3, trade_time: "2018-04-23 07:30:00")
Transact.create(we_buy: true, size: 2400, price: 85.25, bond_id: 2, client_id: 2, trader_id: 3, trade_time: "2018-02-09 07:30:00")
Transact.create(we_buy: false, size: 9000, price: 85.625, bond_id: 2, client_id: 4, trader_id: 3, trade_time: "2018-01-03 10:30:00")

Transact.create(we_buy: true, size: 500, price: 90.20, bond_id: 3, client_id: 3, trader_id: 2, trade_time: "2018-03-15 07:30:00")
Transact.create(we_buy: true, size: 2000, price: 92.25, bond_id: 3, client_id: 1, trader_id: 2, trade_time: "2018-01-28 10:30:00")
Transact.create(we_buy: false, size: 1000, price: 89.65, bond_id: 3, client_id: 5, trader_id: 2, trade_time: "2018-01-13 07:30:00")

Transact.create(we_buy: false, size: 4000, price: 105.5, bond_id: 4, client_id: 5, trader_id: 2, trade_time: "2018-01-22 07:30:00")
Transact.create(we_buy: true, size: 1000, price: 107.375, bond_id: 4, client_id: 1, trader_id: 2, trade_time: "2018-02-26 07:30:00")
Transact.create(we_buy: true, size: 1000, price: 106.25, bond_id: 4, client_id: 3, trader_id: 2, trade_time: "2018-04-03 07:30:00")


Transact.create(we_buy: true, size: 4000, price: 82.25, bond_id: 5, client_id: 2, trader_id: 1, trade_time: "2018-01-30 12:30:00")
Transact.create(we_buy: false, size: 7500, price: 85.5, bond_id: 5, client_id: 4, trader_id: 1, trade_time: "2018-04-13 11:30:00")
Transact.create(we_buy: true, size: 500, price: 83.75, bond_id: 5, client_id: 3, trader_id: 1, trade_time: "2018-01-03 07:30:00")

Transact.create(we_buy: false, size: 3000, price: 100.5, bond_id: 6, client_id: 5, trader_id: 4, trade_time: "2018-01-10 07:30:00")
Transact.create(we_buy: true, size: 2000, price: 101.25, bond_id: 6, client_id: 1, trader_id: 4, trade_time: "2018-05-01 11:00:00")
Transact.create(we_buy: false, size: 1000, price: 98.75, bond_id: 6, client_id: 2, trader_id: 4, trade_time: "2018-03-28 07:30:00")

Transact.create(we_buy: false, size: 2000, price: 110.25, bond_id: 7, client_id: 3, trader_id: 4, trade_time: "2018-02-03 07:30:00")
Transact.create(we_buy: true, size: 4000, price: 109.875, bond_id: 7, client_id: 4, trader_id: 4, trade_time: "2018-04-21 14:30:00")
Transact.create(we_buy: true, size: 1000, price: 108.65, bond_id: 7, client_id: 1, trader_id: 4, trade_time: "2018-03-15 10:45:00")