require_relative '../lib/webserver_lib.rb'
require_relative './webserver_test_lib.rb'

require 'minitest/autorun'

class TestWebserverSecurity < TestWebserver


  def test_get_headers_for_directory
    @port+=9
    webutils = Webutils.new(@directory)
    server = setup_service()
    command = get_curl_for_file("/testdir", true)
    output_text = `#{command}`

    expected_header = <<EOT
HTTP/1.1 404 Not Found
Content-type: text/html
Content-length: 111

EOT
    assert_equal(output_text, expected_header)
  end


  def test_get_text_for_directory 
    @port+=10
    webutils = Webutils.new(@directory)
    server = setup_service()
    command = get_curl_for_file("/testdir", false)
    output_text = `#{command}`
    expected_text =<<EOF
<html><head><title>Not Found</title></head><body>
Sorry, the object you requested was not found.
</body><html>
EOF
    assert_equal(output_text, expected_text)
  end

  def test_get_text_for_file_up_the_permissions_tree
    @port+=11
    webutils = Webutils.new(@directory)
    webheaders = Webheaders.new()
    server = setup_service()
    command = get_curl_for_file("/../../README.md", false)
    output_text = `#{command}`
    expected_text =<<EOF
<html><head><title>Not Found</title></head><body>
Sorry, the object you requested was not found.
</body><html>
EOF
    assert_equal(output_text, expected_text) 
  end

  
  def test_get_header_for_file_up_the_permissions_tree
    @port+=12
    server = setup_service()
    command = get_curl_for_file("/../../README.md", true)
    output_header = `#{command}` 
    expected_header = <<EOT
HTTP/1.1 404 Not Found
Content-type: text/html
Content-length: 111

EOT
    assert_equal(output_header, expected_header)
  end


end
