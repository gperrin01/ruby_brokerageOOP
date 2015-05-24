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

  def balance
    # sum for each stock: noshares*price
  end


end