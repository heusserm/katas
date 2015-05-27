require_relative '../lib/webserver_lib.rb'

require 'minitest/autorun'

class TestWebheaders < MiniTest::Test

  def test_get_404_error
    expected = "HTTP/1.1 404 Not Found\nContent-type: text/html\nContent-length: 111\n\n"
    expected+="<html><head><title>Not Found</title></head><body>\n"
    expected+="Sorry, the object you requested was not found.\n"
    expected+="</body><html>\n"
    headers = Webheaders.new()
    assert_equal(expected, headers.get_404_error())
  end

  def test_get_200_header
    expected = "HTTP/1.1 200 OK\r\n"
    expected+= "Content-Type: text/html\r\n"
    expected+= "Content-Length: 5\r\n"
    expected+= "Connection: close\r\n\r\n"
    headers = Webheaders.new()
    assert_equal(expected, headers.get_200_header("hello"))
  end


end

