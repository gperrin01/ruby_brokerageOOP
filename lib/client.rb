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

  def sell(stock, sold_shares, price, portfolio)
    stock.no_shares -= sold_shares
    stock.price = price
    @balance += price*sold_shares
    # not checking numshares to sell as we allow short selling
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

end