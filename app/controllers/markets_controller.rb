class MarketsController < ApplicationController

  def index
    @markets = MarketMoneyApiFacade.get_markets
    # require 'pry'; binding.pry
  end

end