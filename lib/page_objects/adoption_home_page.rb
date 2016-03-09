class AdoptionHomePage < Page

  def initialize(browser)
    super(browser)
  end

  def adoption_section
    browser.find_element(:link, 'ADOPTION')
  end

  def home_section
    browser.find_element(:link, 'HOME')
  end

end