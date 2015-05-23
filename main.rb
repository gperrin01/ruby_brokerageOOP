require 'pry'
require-relative '/lib/brokerage'
require-relative '/lib/client'
require-relative '/lib/portfolio'
require-relative '/lib/stock'

aapl = Stock.new(:aapl, 24, 132.5)
goog = Stock.new(:goog, 2, )
amzn = Stock.new(:amzn, 40, 427)
usd_bank = Stock.new(:usd_bank, 4, )
td_bank = Stock.new(:td_bank, 34, )
bofa = Stock.new(:bofa, 10, )
ge = Stock.new(:ge, 10, )
solarwind = Stock.new(:solarwind, 10, )
green_energy = Stock.new(:bofa, 10, )

tech_pf = Portfolio.new('Tech p/f', {
          (aapl.name): aapl, (goog.name): goog, (amzn.name): amzn
          })
bank_pf = Portfolio.new('Bank p/f', {
          (usd_bank.name): usd_bank, (td_bank.name): td_bank, (bofa.name): bofa
          })
energy_pf = Portfolio.new('Energy p/f', {
          (ge.name): ge, (solarwind.name): solarwind, (energy_pf.name): energy_pf
          })

bob = Client.new("Bob", "750000", {
        (tech_pf.name): tech_pf, (bank_pf): bank_pf, (energy_pf.name): energy_pf
  })

def menu
  puts `clear`
  puts '*** GASE ***'
  puts '1 - Create a client'
  puts '2 - Create a portfolio'
  puts '3 - Purchase Stocks'
  puts '4 - Sell Stocks'
  puts '5 - List all clients and their balances'
  puts "6 - List a client's portfolios and associated values"
  puts "7 - List all stocks in a portfolio and associated values"
  puts 'q - Quit program'
  print "--> "
  gets.chomp.downcase
end