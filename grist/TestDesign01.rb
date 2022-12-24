#TestDesign01.rb
#First Example in the test design chapter 
#(C) 2022, Matthew Heusser
#
#-----------------------------------------
 
print "Enter your name "
name = gets.chomp().downcase()

if (name == "victor") 
  puts "Congratulations on your win!
else
  puts "hello, " + name + "\n";
end

