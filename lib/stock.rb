class Stock

  attr_accessor :name, :no_shares, :price

  def initialize(options={})
    @name = options[:name]
    @no_shares = options[:no_shares]
    @price = options[:price]
  end


end