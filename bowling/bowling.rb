require_relative 'lib/bowling_oo.rb'


playing = Game.new();
playing.roll(1,1);
playing.roll(1,1);
playing.roll(1,1);
playing.roll(1,1);
score = playing.result();
puts "Total score is: " + score.to_s();
