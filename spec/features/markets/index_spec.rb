require 'rails_helper'

RSpec.describe "Market index page", type: :feature do
  include ApplicationHelper

  it "Shows all markets with name as a link to its show page, city, state" do
    VCR.use_cassette("market_index_data", serialize_with: :json) do |cassette|
      visit markets_path

      expect(page.status_code).to eq(200)

      body = JSON.parse(
        cassette.serializable_hash.dig("http_interactions", 0, "response", "body", "string"),
        symbolize_names: true
      )

      markets = body[:data]
    
      within '.markets' do
        expect(page).to have_selector('li.market')

        markets.first(3).each do |market_data|
          name = strip_whitespace(market_data[:attributes][:name])
          city = strip_whitespace(market_data[:attributes][:city].to_s)
          state = strip_whitespace(market_data[:attributes][:state])
          
          expect(page).to have_link(name)
          expect(page).to have_content(city)
          expect(page).to have_content(state)
        end
        first_market_name = strip_whitespace(markets.first[:attributes][:name])
        first_market_id = markets.first[:id]
        # require 'pry'; binding.pry
        VCR.use_cassette("market_show_data_#{first_market_id}", serialize_with: :json) do
        click_on first_market_name
        expect(current_path).to eq(market_path(first_market_id))
      end
    end
    end 
  end
end