class AdoptionPassPage < Page

  def initialize(browser)
    super(browser)
  end

  def name_input
    browser.find_element(:name, "name_field")
  end

  def email_input
    browser.find_element(:name, "email_field")
  end

  def address_input
    browser.find_element(:name, "address_field")
  end

  def postcode_input
    browser.find_element(:name, "postcode_field")
  end

  def submit_button
    browser.find_element(:id, "submit_adoption")
  end

end