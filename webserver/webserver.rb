#webserver.rb


require_relative 'lib/webserver_lib.rb'

puts "\nSimple Ruby Webserver\nBy Matthew Heusser Matt@xndev.com\n----------------------------------\n"
puts " Param1: Port to bind to, eg 80, etc. "
puts " Param2: Directory to bind to, such as ./test_files"
puts " Default values are 8080 and ./test_files \n\n"

port = ARGV[0]
directory = ARGV[1]

if directory==nil || directory.class!=String || directory.length==0
  directory = "./test/test_files"
end


if port==nil || directory.class!=Fixnum || port<1 || port > 10000
  port = 8080
end



webserver=Webserver.new(port, directory)
webserver.serve()

