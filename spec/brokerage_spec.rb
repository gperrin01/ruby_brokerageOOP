require_relative 'spec_helper'

describe Brokerage do 

  let(:brokerage) {Brokerage.new({name:'testbrokerage'})}
  let(:client) {Client.new({name: 'testclient', balance: '100'})}

  it "can create a new client" do
    expect(brokerage.client_count).to eq 0
    brokerage.create_client(client)
    expect(brokerage.client_count).to eq 1
  end


end