require 'rails_helper'
require 'yaml'

RSpec.describe "Market index page", type: :feature, vcr: true do
  before(:each) do
    VCR.use_cassette("market_index_data") do
      @markets_data = MarketMoneyApiFacade.get_markets["data"]
    end
  end

  it "Shows all markets with name, city, and state" do
    visit markets_path
    
    expect(page.status_code).to eq(200)
  
    within '.markets' do
      expect(page).to have_selector('li.market')

      @markets_data.each do |market_data|
        market_attributes = market_data["attributes"]
        
        name = (market_attributes["name"]).gsub(/\s+/, ' ').strip
        city = (market_attributes["city"]).to_s.gsub(/\s+/, ' ').strip
        state = (market_attributes["state"]).gsub(/\s+/, ' ').strip
        
        expect(page).to have_link(name)
        expect(page).to have_content(city)
        expect(page).to have_content(state)
      end
    end
    # end
  end
end