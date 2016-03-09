class GhostHomePage < Page

  def initialize(browser)
    super(browser)
  end

  def user_name
    browser.find_element(:id, 'username')
  end

  def email_address
    browser.find_element(:id, 'email')
  end

  def password
    browser.find_element(:id, 'password')
  end

  def try_button
    browser.find_element(:css, '.home-signup-button.button-add')
  end

end