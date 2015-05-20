

class Webserver
  attr_accessor :port

  def initialize(port,directory)
    @port = port
    @directory = directory
  end

  def serve()
    webpage = ""
    #While Loop
    #Fork
    #Inside Fork
      if get(webpage) 
        #Return webpage
        i=1
      else
        #200 error message
        i=1
      end
  end

  def get(webpage)
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



