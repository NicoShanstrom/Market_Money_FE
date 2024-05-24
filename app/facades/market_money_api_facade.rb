class MarketMoneyApiFacade

  def self.get_markets
    response = MarketMoneyApi.get("/api/v0/markets")
  end

  def self.get_market(id)
    response = MarketMoneyApi.get("/api/v0/markets/#{id}")
  end

  def self.get_market_vendors(market_id)
    response = MarketMoneyApi.get("/api/v0/markets/#{market_id}/vendors")
  end

  # def self.get_vendors
  #   response = MarketMoneyApi.get("/api/v0/vendors")
  # end

  def self.get_vendor(id)
    response = MarketMoneyApi.get("/api/v0/vendors/#{id}")
  end

end