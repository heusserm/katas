require_relative '../lib/webserver_lib.rb'

require 'minitest/autorun'


class TestWebserver < MiniTest::Test
  attr :port
  attr :directory
  attr :child_process

  def setup()
    @port = 8195
    @directory = "./test_files"
    @child_process = nil
  end


  def teardown
    if @child_process!=nil
      Process.kill(0, @child_process)
      @child_process = nil
    end
  end

  def setup_service()
    server = Webserver.new(@port,@directory)
    headers = Webheaders.new()
    fork do
      @child_process = Process.pid
      server.serve_one()
    end
    sleep(0.25)
    return server
  end

  def get_curl_for_file(file, includeheaders)
    setup = "curl "
    if includeheaders
        setup = setup + " -I "
    end
    setup = setup + "--silent --show-error http://localhost:" + @port.to_s() + file
    return setup
  end



end
