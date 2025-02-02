#dirtyfizzbuzz.rb

require_relative 'lib/dirtyfizzbuzz_lib.rb'
dirtyfizzbuzz=Dirtyfizzbuzz.new()

for n in 1..ARGV[0].to_i() do
  printed=false;
  if (n %3==0) 
    print "fizz"
    printed=true; 
  end

   if (n%5==0)
    print "buzz"
    printed=true
  end

  if (!printed)
    print n.to_i()
  end
  
  print "\n"
end

