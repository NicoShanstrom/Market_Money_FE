module ApplicationHelper

  def strip_whitespace(string)
    string.gsub(/\s+/, ' ').strip
  end

  def boolean_yes_no(boolean)
    boolean ? 'Yes' : 'No'
  end
end
