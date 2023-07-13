print "Enter your name: "
name = gets.chomp().downcase()

if name == "victor"
  puts "Congratulations on your win!"
else
  puts "Hello, #{name}!"
end

