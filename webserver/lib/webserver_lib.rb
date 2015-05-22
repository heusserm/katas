
require 'socket'

class Webserver
  attr_accessor :port

  def initialize(port,directory)
    @port = port
    @directory = directory
    @server = TCPServer.new('localhost', @port)
  end

  def serve()
    loop do 
      socket = @server.accept
      request = socket.gets
      STDERR.puts request

      results = get_web_formatted_page(request)
      socket.print results
      socket.close 
    end
  end


  def get_filename(getrequest)
    match_data = /\/(.*) HTTP/.match(getrequest)
    result  = match_data.captures[0]
    result=result.downcase.gsub( /\.\./,"").gsub(" ", "").gsub(",","").gsub("'","")
    result=result.gsub(";", "").gsub(":","").gsub("<", "").gsub("?", "").gsub("!", "").gsub("^","")
    result=result.gsub("%", "").gsub("$","").gsub("$","").gsub(">","")
    return result
  end

  def get_404_error()
 result =<<EOF
HTTP/1.1 404 Not Found
Content-type: text/html
Content-length: 111

<html><head><title>Not Found</title></head><body>
Sorry, the object you requested was not found.
</body><html>
EOF
  return result
end

  def get_200_header(text)
    result = "HTTP/1.1 200 OK\r\n" +
             "Content-Type: text/html\r\n" +
             "Content-Length: #{text.bytesize}\r\n" +
             "Connection: close\r\n\r\n"
    return result
  end

  def get_web_formatted_page(web_request)
    true_file_name = get_filename(web_request)
    result = get_file(true_file_name)
    postval = ""
    if (result!=nil && result.class == String && result.length>0)
      postval = get_200_header(result)
      postval+=result
    else
      postval = get_404_error() 
    end
    return postval
  end

  def get_file(webpage)
    begin 
      filename = @directory+"/"+webpage
      file = File.open(filename, "rb")
      contents = file.read
      file.close
      return contents
    rescue
      return nil
    end
  end

end



