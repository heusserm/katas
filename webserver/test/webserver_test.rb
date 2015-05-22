require_relative '../lib/webserver_lib.rb'

require 'minitest/autorun'

class TestWebserver < MiniTest::Test

   def test_init 
    server = Webserver.new(8080,"./test_files")
    assert(server!=nil,"Created object")
    assert_equal(Webserver, server.class)
  end

  def test_get_404_error
    expected = "HTTP/1.1 404 Not Found\nContent-type: text/html\nContent-length: 111\n\n"
    expected+="<html><head><title>Not Found</title></head><body>\n"
    expected+="Sorry, the object you requested was not found.\n"
    expected+="</body><html>\n"
    server = Webserver.new(8081,"./test_files")
    assert_equal(expected, server.get_404_error())
  end

  def test_get_200_header
    expected = "HTTP/1.1 200 OK\r\n"
    expected+= "Content-Type: text/plain\r\n" 
    expected+= "Content-Length: 5\r\n" 
    expected+= "Connection: close\r\n\r\n"
    server = Webserver.new(8082,"./test_files")
    assert_equal(expected, server.get_200_header("hello"))
  end

  def test_get_url
    inval = "GET /test HTTP/1.1"
    expected = "test"
    server = Webserver.new(8083,"./test_files")
    assert_equal(expected, server.get_url(inval))
  end

  def test_get_url_with_html_and_slashes
    inval = "GET /test/somedir/file.htm HTTP/1.1"
    expected = "test/somedir/file.htm"
    server = Webserver.new(8083,"./test_files")
    assert_equal(expected, server.get_url(inval))
  end    

  def test_get_web_formatted_non_file
    server = Webserver.new(8084,"./test_files")
    assert_equal(server.get_404_error, server.get_web_formatted_page("notafile"))
  end


  def test_get_not_a_file
    server = Webserver.new(8085,"./test_files")
    getval = server.get_file("notafile")
    assert_equal(nil, getval)
  end

  def test_get_a_file
    server = Webserver.new(8086,"./test_files")
    actual_result = server.get_file("simple.txt")
expected_result=<<EOF
This is a very simple test.
To tell if the software can read a ASCII file
EOF
    assert_equal(expected_result, actual_result)
  end

end
