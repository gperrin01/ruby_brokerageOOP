require 'pry'
require_relative 'lib/brokerage'
require_relative 'lib/client'
require_relative 'lib/portfolio'
require_relative 'lib/stock'

aapl = Stock.new(:aapl, 24, 132.5)
goog = Stock.new(:goog, 2, 540 )
amzn = Stock.new(:amzn, 40, 427)
usd_bank = Stock.new(:usd_bank, 4, 76)
td_bank = Stock.new(:td_bank, 34, 143)
bofa = Stock.new(:bofa, 10, 44 )
ge = Stock.new(:ge, 10, 200)
solarwind = Stock.new(:solarwind, 10,112 )
green_energy = Stock.new(:green_energy, 10, 200)

tech_pf = Portfolio.new('Tech p/f', {
          aapl.name => aapl, goog.name => goog, amzn.name=> amzn
          })
bank_pf = Portfolio.new('Bank p/f', {
          usd_bank.name => usd_bank, td_bank.name => td_bank, bofa.name => bofa
          })
energy_pf = Portfolio.new('Energy p/f', {
          ge.name => ge, solarwind.name => solarwind, green_energy.name => green_energy
          })

bob = Client.new("Bob", "750000", {
        tech_pf.name => tech_pf, bank_pf => bank_pf, energy_pf.name => energy_pf
  })

ga_securities = Brokerage.new('GA Securities', {bob.name => bob})

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

response = menu

while response != 'q'

  case response
  when '1'
    puts "Let's create a new client"
    print "Client's name: "
    name = gets.chomp
    print "Client's balance: "
    balance = gets.to_f
    Client.new(name, balance)
  when '2'
  when '3'
  when '4'
  when '5'
  when '6'
  when '7'
  end
  puts '-'*40
  puts "Press Enter to go back to main menu"
  gets
  response = menu
end






binding.pry
nil