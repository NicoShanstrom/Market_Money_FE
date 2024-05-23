require 'rails_helper'
RSpec.describe "Market show page", type: :feature do
  include ApplicationHelper

  it "Shows market name, contact info, if the accept credit, and a description of what they sell", :vcr do 
    visit vendor_path(vendor_id)

    vendor_attributes = vendor[:attributes]
    name = vendor_attributes[:name].strip_whitespace
    contact_name = vendor_attributes[:contact_name].strip_whitespace
    contact_phone = vendor_attributes[:contact_phone].strip_whitespace
    credit_accepted = vendor_attributes[:credit_accepted].strip_whitespace
    description = vendor_attributes[:description].strip_whitespace
    expect(page).to have_content("vendor.name")
    expect(page).to have_content("Contact Info:")
    expect(page).to have_content("Name: vendor.contact_name")
    expect(page).to have_content("Phone: vendor.contact_phone")
    expect(page).to have_content("Credit Accepted?: vendor.credit_accepted")
    expect(page).to have_content("Description: vendor.description")
  end
end