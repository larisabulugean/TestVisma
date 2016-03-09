class SeleniumConfig
  attr_accessor :selenium_server

  def is_local?
    return (@host == 'localhost' || @host == '127.0.0.1')
  end
end