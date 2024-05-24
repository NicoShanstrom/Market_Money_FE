require 'rails_helper'
RSpec.describe "Market show page", type: :feature do
  include ApplicationHelper

  it "Shows market name, contact info, if the accept credit, and a description of what they sell", :vcr do 
    visit vendor_path(vendor_id)

    vendor_attributes = vendor[:attributes]
    name = strip_whitespace(vendor_attributes[:name])
    contact_name = strip_whitespace(vendor_attributes[:contact_name])
    contact_phone = strip_whitespace(vendor_attributes[:contact_phone])
    credit_accepted = strip_whitespace(vendor_attributes[:credit_accepted])
    description = strip_whitespace(vendor_attributes[:description])
    
    expect(page).to have_content("vendor.name")
    expect(page).to have_content("Contact Info:")
    expect(page).to have_content("Name: vendor.contact_name")
    expect(page).to have_content("Phone: vendor.contact_phone")
    expect(page).to have_content("Credit Accepted?: vendor.credit_accepted")
    expect(page).to have_content("Description: vendor.description")
  end
end