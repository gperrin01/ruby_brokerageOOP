class Portfolio

  attr_accessor :name, :stocks

  def initialize(name, stocks)
    @name = name
    @stocks = stocks || {}
  end


end