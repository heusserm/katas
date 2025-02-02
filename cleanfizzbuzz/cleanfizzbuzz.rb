#cleanfizzbuzz.rb

require_relative 'lib/cleanfizzbuzz_lib.rb'

if (ARGV[0].to_i<1 && ARGV[0].length>0)
    puts "\n-------------\nUsage: cleanfizzbuzz.rb (integer). Must input an integer.\n-------------\n"
    abort();
end

cleanfizzbuzz=Cleanfizzbuzz.new()
result = cleanfizzbuzz.getFizzBuzzForAGroupOneTo(ARGV[0].to_i());
puts(result);

