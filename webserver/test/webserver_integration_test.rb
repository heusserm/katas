require_relative '../lib/webserver_lib.rb'
require_relative './webserver_test_lib.rb'

require 'minitest/autorun'

class TestWebserverIntegration < TestWebserver


  def test_get_web_formatted_valid_file 
    @port+=1
    webutils = Webutils.new(@directory)
    server = setup_service()
    expected_text = webutils.get_file("mysite.css")
    assert(expected_text.length()==149)  
    command = get_curl_for_file("./mysite.css", false)
    output_text = `#{command}`
    assert_equal(output_text, expected_text)
  end

  def test_get_web_formatted_valid_file_header
    @port+=2
    webutils = Webutils.new(@directory)
    webheaders = Webheaders.new()
    server = setup_service()
    file_text = webutils.get_file("mysite.css")
    expected_text = webheaders.get_200_header(file_text)
    assert(expected_text.length()>50)
    command = get_curl_for_file("./mysite.css", true)
    output_text = `#{command}`
    assert_equal(output_text, expected_text) 
  end

  
  def test_get_web_formatted_non_file_http_header
    @port+=3
    server = setup_service()
    command = get_curl_for_file("./notafile.html", true)
    output_header = `#{command}` 
    expected_header = <<EOT
HTTP/1.1 404 Not Found
Content-type: text/html
Content-length: 111

EOT
    assert_equal(output_header, expected_header)
  end

  def test_get_web_formatted_non_file_http_content
    @port+=4
    server = setup_service()
    command = get_curl_for_file("./notafile.html",false)
    output_text = `#{command}`
    expected_text = <<EOT
<html><head><title>Not Found</title></head><body>
Sorry, the object you requested was not found.
</body><html>
EOT
    assert_equal(output_text, expected_text)
  end
  

end
