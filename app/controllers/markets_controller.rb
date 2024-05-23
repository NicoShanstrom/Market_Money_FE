class MarketsController < ApplicationController

  def index
    markets_data = MarketMoneyApiFacade.get_markets
    # require 'pry'; binding.pry
    @markets = MarketService.build_markets(markets_data)
  end

  def show
    @market = Market.new(MarketMoneyApiFacade.get_market(params[:id]))
    @market_vendors = MarketVendorService.build_vendors(MarketMoneyApiFacade.get_market_vendors(params[:id]))
    # require 'pry'; binding.pry
  end
end