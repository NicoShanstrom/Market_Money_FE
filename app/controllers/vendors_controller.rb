class VendorsController < ApplicationController
  # def index
  #   vendors_data = MarketMoneyApiFacade.get_vendors
  #   @vendors = VendorService.build_vendors(vendors_data)
  # end
  
  def show
    @vendor = Vendor.new(MarketMoneyApiFacade.get_vendor(params[:id]))
  end
end