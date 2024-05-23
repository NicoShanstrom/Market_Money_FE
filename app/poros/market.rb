class Market
  attr_reader :id, :name, :street, :city, :county, :state, :zip, :lat, :lon, :vendor_count

   def initialize(data)
    if data.key?("attributes")
      initialize_from_attributes(data)
    else
      initialize_from_data(data)
    end
  end

  private

  def initialize_from_attributes(data)
    @id = data["id"]
    @name = data["attributes"]["name"]
    @street = data["attributes"]["street"]
    @city = data["attributes"]["city"]
    @county = data["attributes"]["county"]
    @state = data["attributes"]["state"]
    @zip = data["attributes"]["zip"]
    @lat = data["attributes"]["lat"]
    @lon = data["attributes"]["lon"]
    @vendor_count = data["attributes"]["vendor_count"]
  end

  def initialize_from_data(data)
    @id = data["data"]["id"]
    @name = data["data"]["attributes"]["name"]
    @street = data["data"]["attributes"]["street"]
    @city = data["data"]["attributes"]["city"]
    @county = data["data"]["attributes"]["county"]
    @state = data["data"]["attributes"]["state"]
    @zip = data["data"]["attributes"]["zip"]
    @lat = data["data"]["attributes"]["lat"]
    @lon = data["data"]["attributes"]["lon"]
    @vendor_count = data["data"]["attributes"]["vendor_count"]
  end
end