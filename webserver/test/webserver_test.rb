require_relative '../lib/webserver_lib.rb'

require 'minitest/autorun'

class TestWebserver < MiniTest::Test

   def test_init 
    server = Webserver.new(8080,"./test_files")
    assert(server!=nil,"Created object")
    assert_equal(Webserver, server.class)
  end

  def test_get_blank_url_redirects_to_index
    inval = "GET HTTP/1.1"
    expected = "index.html"
    server = Webserver.new(8083,"./test_files")
    assert_equal(expected, server.get_filename(inval))
  end

  def test_get_just_slash_url_redirects_to_index
    inval = "GET / HTTP/1.1"
    expected = "index.html"
    server = Webserver.new(8084,"./test_files")
    assert_equal(expected, server.get_filename(inval))
  end

  def test_get_filename
    inval = "GET /test HTTP/1.1"
    expected = "test"
    server = Webserver.new(8085,"./test_files")
    assert_equal(expected, server.get_filename(inval))
  end

  def test_get_url_with_html_and_slashes
    inval = "GET /test/somedir/file.htm HTTP/1.1"
    expected = "test/somedir/file.htm"
    server = Webserver.new(8086,"./test_files")
    assert_equal(expected, server.get_filename(inval))
  end    

  def test_get_web_formatted_non_file
    inval = "GET /notafile HTTP/1.1"
    server = Webserver.new(8087,"./test_files")
    headers = Webheaders.new()
    assert_equal(headers.get_404_error(), server.get_web_formatted_page(inval))
  end

end
