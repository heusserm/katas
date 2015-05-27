
require 'socket'

class Webheaders

  def initialize()
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

end

class Webutils
  attr :directory

  def initialize(directory)
    @directory = directory
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


class Webserver
  attr_accessor :port
  attr :webheaders
  attr :webutils

  def initialize(port,directory)
    @port = port
    @directory = directory
    @server = TCPServer.new('localhost', @port)
    @webheaders = Webheaders.new()
    @webutils = Webutils.new(directory)
  end

  def serve()
    loop do 
      serve_one()
    end
  end

  def serve_one()
    socket = @server.accept
    fork do
      request = socket.gets
      STDERR.puts request
      results = get_web_formatted_page(request)
      socket.print results
      socket.close
    end
    socket.close  
  end

  def get_filename(getrequest)
    match_data = /\/(.*) HTTP/.match(getrequest)
    result = ""
    if (match_data == nil ||
        match_data.captures==nil || match_data.captures[0]==nil || match_data.captures[0].class!=String ||
        match_data.captures[0].length<1)
      result = "index.html"
    else
      result  = match_data.captures[0]
    end
    result=result.downcase.gsub( /\.\./,"").gsub(" ", "").gsub(",","").gsub("'","")
    result=result.gsub(";", "").gsub(":","").gsub("<", "").gsub("?", "").gsub("!", "").gsub("^","")
    result=result.gsub("%", "").gsub("$","").gsub("$","").gsub(">","")
    return result
  end

  def get_web_formatted_page(web_request)
    true_file_name = get_filename(web_request)
    
    result = @webutils.get_file(true_file_name)
    postval = ""
    if (result!=nil && result.class == String && result.length>0)
      postval = @webheaders.get_200_header(result)
      postval+=result
    else
      postval = @webheaders.get_404_error() 
    end
    return postval
  end
end



