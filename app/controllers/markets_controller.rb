class MarketsController < ApplicationController

  def index
    @markets = MarketMoneyApiFacade.get_markets
    # require 'pry'; binding.pry
  end

  def show
    @market = MarketMoneyApiFacade.get_market(params[:id])
    @market_vendors = MarketMoneyApiFacade.get_market_vendors(params[:id])
    # require 'pry'; binding.pry
  end
end