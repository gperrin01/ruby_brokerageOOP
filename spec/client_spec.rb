require_relative 'spec_helper'

# can buy stock to a portfolio
  # updates balance and no_shares
  # updates price of the stock
# can sell stockfrom pf

describe Client do 

  let(:brokerage) {Brokerage.new({name:'testbrokerage'})}
  let(:client) {Client.new({name: 'testclient', balance: 2000})}
  let(:portfolio) {Portfolio.new({name: 'testp/f'})}
  let(:stock) {Stock.new({name: 'test_stock', no_shares: 50, price: 100})}

  it "can create a new portfolio" do
    expect(client.portfolio_count).to eq 0
    client.create_portfolio(portfolio)
    expect(client.portfolio_count).to eq 1
  end

  it "can only buy if have sufficient funds" do
    client.balance = 1000
    client.create_portfolio(portfolio)
    expect { client.buy(stock, 10, 140, portfolio) }.to raise_error RuntimeError 
  end
  
  it "updates client balance after purchase" do

  end

end