class MarketsController < ApplicationController

  def index
    @markets = MarketMoneyApiFacade.get_markets
    # require 'pry'; binding.pry
  end

  def show
    @market = MarketMoneyApiFacade.get_market(id)
  end

end