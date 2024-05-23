class MarketService
  def self.build_markets(markets_data)
    if markets_data["data"].first.key?("attributes")
      # Data structure contains attributes key, directly pass the data
      markets_data["data"].map { |market_data| Market.new(market_data) }
    else
      # Data structure doesn't contain attributes key, pass data["data"] to Market constructor
      markets_data["data"].map { |market_data| Market.new(market_data["data"]) }
    end
  end
end