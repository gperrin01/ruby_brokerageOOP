class Client

  attr_accessor :name, :balance, :portfolios

  def initialize(options ={})
    @name = options[:name]
    @balance = options[:balance]
    @portfolios = options[:portfolios] || {}
   end


end