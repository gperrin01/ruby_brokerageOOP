require 'pry'
require_relative 'lib/brokerage'
require_relative 'lib/client'
require_relative 'lib/portfolio'
require_relative 'lib/stock'

aapl = Stock.new({name: :aapl, no_shares: 24, price: 132})
goog = Stock.new({name: :goog, no_shares: 2, price: 540} )
amzn = Stock.new({name: :amzn, no_shares: 40, price: 427})
usd_bank = Stock.new({name: :usd_bank, no_shares: 4, price: 76})
td_bank = Stock.new({name: :td_bank, no_shares: 34, price: 143})
bofa = Stock.new({name: :bofa, no_shares: 10, price: 44} )
ge = Stock.new({name: :ge, no_shares: 10, price: 200})
solarwind = Stock.new({name: :solarwind, no_shares: 10,price: 112})
green_energy = Stock.new({name: :green_energy, no_shares: 10, price: 200})

tech_pf = Portfolio.new({name:'Tech', stocks: {
          aapl.name => aapl, goog.name => goog, amzn.name=> amzn
          } })
bank_pf = Portfolio.new({name: 'Bank', stocks: {
          usd_bank.name => usd_bank, td_bank.name => td_bank, bofa.name => bofa
          }})
energy_pf = Portfolio.new({name: 'Energy', stocks: {
          ge.name => ge, solarwind.name => solarwind, green_energy.name => green_energy
          }})

bob = Client.new(name: "Bob", balance: 750000, portfolios:{
        tech_pf.name => tech_pf, bank_pf => bank_pf, energy_pf.name => energy_pf
  })

ga_securities = Brokerage.new(name: 'GA Securities', clients: {bob.name => bob})

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
    client = Client.new({name: name, balance: balance})
    ga_securities.create_client(client)

  when '2'
    puts "Let's create a new portfolio"
    puts "For which client? \n#{ga_securities.clients.keys.join(' ')}"
    client = ga_securities.clients[gets.chomp]
    print "Portfolio's name: "
    name = gets.chomp
    portfolio = Portfolio.new({name: name})
    client.create_portfolio(portfolio)
    puts "Portfolio #{portfolio.name} added to #{client.name}"

  when '3'
    puts "Buy stock"
    puts "For which client? \n#{ga_securities.clients.keys.join(' ')}"
    client = ga_securities.clients[gets.chomp]
    puts "For which portfolio? \n#{client.portfolios.keys.join(' ')}"
    portfolio = client.portfolios[gets.chomp]
    puts "Stock name? \n#{portfolio.stocks.keys.join(' ')}"
    stock = portfolio.stocks[gets.chomp.downcase.to_sym]
    print "How many shares: "
    extra_shares = gets.to_f
    print "Confirm trading price: "
    price = gets.to_f
    client.buy(stock, extra_shares, price, portfolio)
    puts "#{client.name} bought #{extra_shares} #{stock.name} at $#{price} for #{portfolio.name}. \n New balance is #{client.balance}"

  when '4'
    puts "Sell stock"
    puts "For which client? \n#{ga_securities.clients.keys.join(' ')}"
    client = ga_securities.clients[gets.chomp]
    puts "For which portfolio? \n#{client.portfolios.keys.join(' ')}"
    portfolio = client.portfolios[gets.chomp]
    puts "Stock name? \n#{portfolio.stocks.keys.join(' ')}"
    stock = portfolio.stocks[gets.chomp.downcase.to_sym]
    print "How many shares: "
    sold_shares = gets.to_f
    print "Confirm trading price: "
    price = gets.to_f
    client.sell(stock, sold_shares, price, portfolio)
    puts "#{client.name} sold #{sold_shares} #{stock.name} at $#{price} for #{portfolio.name}. \n New balance is #{client.balance}"

  when '5'
    ga_securities.clients.each{|name, client| puts "#{name} has a balance of #{client.balance}"}

  when '6'
    puts "For which client? \n#{ga_securities.clients.keys.join(' ')}"
    client = ga_securities.clients[gets.chomp]
    client.portfolios.each{|name, portfolio| puts "#{name} has a balance of #{portfolio.compute_balance}"}

  when '7'

  end
  puts '-'*40
  puts "Press Enter to go back to main menu"
  gets
  response = menu
end



