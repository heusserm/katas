require_relative 'lib/bowling_arrays.rb'

playing = Game.new();
playing.roll(1);
playing.roll(2);
playing.roll(1);
playing.roll(2);
playing.roll(1);
playing.roll(2);
playing.roll(1);
playing.roll(2);
score = playing.result();
puts "Total score is: " + score.to_s();

