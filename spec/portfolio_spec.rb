require_relative 'spec_helper'

describe Portfolio do 

  let(:brokerage) {Brokerage.new({name:'testbrokerage'})}
  let(:client) {Client.new({name: 'testclient', balance: '100'})}
  let(:portfolio) {Portfolio.new({name: 'testp/f'})}
  let(:stock) {Stock.new({name: 'test_stock', no_shares: 50, price: 100})}

  it "can add stock" do
    expect(portfolio.stock_count).to eq 0
    portfolio.add_stock(stock)
    expect(portfolio.stock_count).to eq 1
  end


   # client.create_portfolio(portfolio)
   #  client.buy(stock, 10, 140, portfolio)


end