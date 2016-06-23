
def ftoc(f)
  return  ( f- 32 )* 5 / 9
end

puts ftoc(ARGV[0].to_i)

