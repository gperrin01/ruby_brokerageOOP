class Client

  attr_accessor

  def initialize(name, balance, portfolios)
    @name = name
    @balance = balance
    @portfolios = portfolios || {}
   end


end