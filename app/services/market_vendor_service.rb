class MarketVendorService
  def self.build_vendors(vendor_data)
    vendor_data["data"].map { |vendor_data| Vendor.new(vendor_data) }
  end
end