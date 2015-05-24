class Client

  attr_accessor :name, :balance, :portfolios

  def initialize(options ={})
    @name = options[:name]
    @balance = options[:balance]
    @portfolios = options[:portfolios] || {}
   end

  def create_portfolio(portfolio)
    @portfolios[portfolio.name] = portfolio
  end
  def portfolio_count
    @portfolios.length
  end

  def buy(stock, extra_shares, price, portfolio)
    
  end

end