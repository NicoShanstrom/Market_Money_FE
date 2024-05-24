class Vendor
  attr_reader :id, :name, :description, :contact_name, :contact_phone, :credit_accepted

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
    @description = data["attributes"]["description"]
    @contact_name = data["attributes"]["contact_name"]
    @contact_phone = data["attributes"]["contact_phone"]
    @credit_accepted = data["attributes"]["credit_accepted"]
  end

  def initialize_from_data(data)
    attributes = data["data"]["attributes"]
    @id = data["data"]["id"]
    @name = attributes["name"]
    @description = attributes["description"]
    @contact_name = attributes["contact_name"]
    @contact_phone = attributes["contact_phone"]
    @credit_accepted = attributes["credit_accepted"]
  end
end