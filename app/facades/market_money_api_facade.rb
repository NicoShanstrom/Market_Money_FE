class MarketMoneyApiFacade

  def self.get_markets
    response = MarketMoneyApi.connection.get('/api/v0/markets')
    handle_response(response)
  end

  def self.get_market(id)
    response = MarketMoneyApi.connection.get("/api/v0/markets/#{id}")
    handle_response(response)
  end

  private

  def self.handle_response(response)
    if response.success?
      response.body
    else
      { error: response.status, message: response.body }
    end
  end
end