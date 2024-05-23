require 'rails_helper'

RSpec.describe "Market show page", type: :feature do
  include ApplicationHelper
  it "Shows market name and a readable address" do 
      VCR.use_cassette("market_show_data_322458", serialize_with: :json) do |cassette|
      
      body = JSON.parse(
        cassette.serializable_hash.dig("http_interactions", 0, "response", "body", "string"),
        symbolize_names: true
      )
      market_data = body[:data]
      market_id = market_data[:id]
      
      visit market_path(market_id)

      expect(page.status_code).to eq(200)
      expect(page).to have_content(market_data[:attributes][:name])
      expect(page).to have_content(market_data[:attributes][:street].strip)
      expect(page).to have_content(market_data[:attributes][:city])
      expect(page).to have_content(market_data[:attributes][:state])
      expect(page).to have_content(market_data[:attributes][:zip])
    end
  end

  it "shows each vendor as a link to its show page", :vcr do 
    market_id = 322458

    VCR.use_cassette("market_322458_vendors", serialize_with: :json) do |cassette|
      body = JSON.parse(
        cassette.serializable_hash.dig("http_interactions", 0, "response", "body", "string"),
        symbolize_names: true
      )
      market_vendors = body[:data]
   
      visit market_path(market_id)
      expect(page.status_code).to eq(200)
     
      within '.market_vendors' do
        market_vendors.each do |vendor|
          vendor_attributes = vendor[:attributes]
          name = strip_whitespace(vendor_attributes[:name])
          expect(page).to have_link(name)
        end
      end
    end
  end 
end