require 'rails_helper'

RSpec.describe "Market show page", type: :feature do
  it "Shows market name and a readable address with each vendor as a link to its show page", :vcr do
    visit market_path(first_market_id)
  end
end