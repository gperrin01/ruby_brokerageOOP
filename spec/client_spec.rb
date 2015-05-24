require_relative 'spec_helper'

# can buy stock to a portfolio
  # updates balance and no_shares
  # updates price of the stock
# can sell stockfrom pf

describe Client do 

  let(:brokerage) {Brokerage.new({name:'testbrokerage'})}
  let(:client) {Client.new({name: 'testclient', balance: '100'})}
  let(:portfolio) {Portfolio.new({name: 'testp/f'})}
  let(:stock) {Stock.new({name: 'test_stock', no_shares: 50, price: 100})}

  it "can create a new portfolio" do
    expect(client.portfolio_count).to eq 0
    client.create_portfolio(portfolio)
    expect(client.portfolio_count).to eq 1
  end

  xit "updates the number of shares in the stocks after purchase" do

  end
  xit "updates price of stock after purchase" do

  end
  xit "updates client balance after purchase" do

  end

end