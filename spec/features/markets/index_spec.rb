require 'rails_helper'


RSpec.describe "Market index page", type: :feature do
  it "Shows all markets with name, city, and state" do
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

        markets.each do |market_data|
          market_attributes = market_data[:attributes]
          
          name = (market_attributes[:name]).gsub(/\s+/, ' ').strip
          city = market_attributes[:city].to_s.gsub(/\s+/, ' ').strip
          state = market_attributes[:state].gsub(/\s+/, ' ').strip
          
          expect(page).to have_link(name) unless name.empty?
          expect(page).to have_content(city) unless name.empty?
          expect(page).to have_content(state) unless name.empty?
        end
      end
    end 
  end
end