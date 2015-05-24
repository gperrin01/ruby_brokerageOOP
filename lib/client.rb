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
    if @balance >= price*extra_shares
      portfolio.add_stock(stock)
      stock.no_shares += extra_shares
      stock.price = price
      @balance -= price*extra_shares
    else  raise "Not enough funds. At a price of #{price} you can buy #{(@balance/price).floor} shares"
    end
  end

end