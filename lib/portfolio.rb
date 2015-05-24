class Portfolio

  attr_accessor :name, :stocks

  def initialize(options={})
    @name = options[:name]
    @stocks = options[:stocks] || {}
  end

  def stock_count
    @stocks.length
  end

  def add_stock(stock)
    if @stocks.has_key?(stock.name)
      puts "stock alredy in #{@name}"
    else  @stocks[stock.name] = stock
    end
  end

  def compute_balance
    # @stocks = { 'aapl': Object AAPL, 'amzn': Object AMZN}
    total = 0
    @stocks.each_value{|stock| total += stock.price*stock.no_shares}
    total
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end


end