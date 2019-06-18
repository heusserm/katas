
def ftoc(f)
    return  ( f- 32 )* 5 / 9
end

if (ARGV[0].to_i==0 && ARGV[0].length>0) 
    puts "Please use integers"
else
    puts ftoc(ARGV[0].to_i)
end
