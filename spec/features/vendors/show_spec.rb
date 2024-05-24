require 'rails_helper'
RSpec.describe "Vendor show page", type: :feature do
  include ApplicationHelper

  it "Shows market name, contact info, if the accept credit, and a description of what they sell", :vcr do 
    VCR.use_cassette("market_322458_vendors", serialize_with: :json) do |cassette|
      body = JSON.parse(
        cassette.serializable_hash.dig("http_interactions", 0, "response", "body", "string"),
        symbolize_names: true
      )
      market_vendors = body[:data]
      vendor_id = market_vendors.first[:id]
      
      VCR.use_cassette("vendor_show_#{vendor_id}", serialize_with: :json) do

        visit vendor_path(vendor_id)
        expect(page.status_code).to eq(200)

        vendor_attributes = market_vendors.first[:attributes]
        name = strip_whitespace(vendor_attributes[:name])
        contact_name = strip_whitespace(vendor_attributes[:contact_name])
        contact_phone = strip_whitespace(vendor_attributes[:contact_phone])
        credit_accepted = boolean_yes_no(vendor_attributes[:credit_accepted])
        description = strip_whitespace(vendor_attributes[:description])
        
        expect(page).to have_content(name)
        expect(page).to have_content("Contact Info:")
        expect(page).to have_content("Name: #{contact_name}")
        expect(page).to have_content("Phone: #{contact_phone}")
        expect(page).to have_content("Credit Accepted?: #{credit_accepted}")
        expect(page).to have_content("Description: #{description}")
      end
    end
  end
end