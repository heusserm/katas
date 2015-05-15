require_relative 'lib/bowling_arrays.rb'

playing = Game.new();
for i in 0..11
  playing.roll(10)
end
score = playing.result()
puts "Total score is: " + score.to_s();

