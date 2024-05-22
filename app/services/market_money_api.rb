class MarketMoneyApi
  v0_base_url = "http://localhost:3000/api/v0"
  
  def self.connection
    @connection ||= Faraday.new(url: v0_base_url) do |conn|
      conn.request :json
      conn.response :json, content_type /\bjson$/ #dont have to use json.parse
      conn.response :logger
    end
  end

  def self.handle_response(response)
    if response.success?
      response.body
    else
      { error: response.status, message: response.body }
    end
  end
end