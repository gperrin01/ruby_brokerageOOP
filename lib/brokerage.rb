class Brokerage

  attr_accessor :clients

  def initialize(options={})
    @name = options[:name]
    @clients = options[:clients] || {}
  end

  def client_count
    @clients.length
  end

  def create_client(client)
    @clients[client.name] = client
  end

end