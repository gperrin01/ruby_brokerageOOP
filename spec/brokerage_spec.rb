require_relative 'spec_helper'

describe Brokerage do 

  let(:brokerage) {Brokerage.new({name:'testbrokerage'})}
  let(:client) {Client.new({name: 'testclient', balance: '100'})}

  it "can create a new client" do
    expect(brokerage.client_count).to eq 0
    brokerage.create_client(client)
    expect(brokerage.client_count).to eq 1
  end
  it "can list all clients and their balances" do
    client_two = Client.new({name: 'test2', balance: '300'})

  end


end