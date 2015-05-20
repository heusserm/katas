#webserver.rb

require_relative 'lib/webserver_lib.rb'
webserver=Webserver.new(8080,"./test/test_files")
webserver.serve()

