class Stock

  attr_accessor :name, :no_shares, :price

  def initialize(name, no_shares, price)
    @name = name
    @no_shares = no_shares
    @price = price
  end


end