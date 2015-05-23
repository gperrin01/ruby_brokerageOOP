class Portfolio

  attr_accessor

  def initialize(name, stocks)
    @name = name
    @stocks = stocks || {}
  end


end