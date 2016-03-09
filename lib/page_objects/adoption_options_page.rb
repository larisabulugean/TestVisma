class AdoptionOptionPage < Page

  def initialize(browser)
    super(browser)
  end

  def select_date_today
    browser.find_element(:xpath, "//*[@id='start_select']/option[@value='today']")
  end

  def turtle_check
    browser.find_element(:id, 'check_btn_02')
  end

end