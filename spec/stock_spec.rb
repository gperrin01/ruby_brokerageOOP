require_relative 'spec_helper'

describe Stock do 

  let(:brokerage) {Brokerage.new({name:'testbrokerage'})}
  let(:client) {Client.new({name: 'testclient', balance: 2000})}
  let(:portfolio) {Portfolio.new({name: 'testp/f'})}
  let(:stock) {Stock.new({name: 'test_stock', no_shares: 50, price: 100})}

  it "updates the number of shares in the stocks after purchase" do
    client.create_portfolio(portfolio)
    client.buy(stock, 10, 140, portfolio)
    expect(stock.no_shares).to eq 60
  end
  it "updates price of stock after purchase" do
    client.create_portfolio(portfolio)
    client.buy(stock, 10, 140, portfolio)
    expect(stock.price).to eq 140
  end

end