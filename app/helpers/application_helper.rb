module ApplicationHelper

  def strip_whitespace(string)
    string.gsub(/\s+/, ' ').strip
  end
end
