#game_of_life.rb

require_relative 'lib/game_of_life_lib.rb'
require_relative 'lib/game_of_life_view.rb'
require_relative 'lib/cursor_wrap.rb'

puts "\n\n-----------------------------------------------------------------------";
puts "game_of_life.rb (numrums) (filename) (optional secs to pause defaults to 1)";
puts " ";
puts "numruns - Number of generations to run";
puts "filename - Path to file to load";
puts " ";
puts "Conway's Game Of Life ASCII\nBy Matthew Heusser Matt@xndev.com\n";
puts "---------------------------------------------------------------------------\n\n"


numruns = ARGV[0];
filename = ARGV[1];
seconds = ARGV[2];
if (seconds==nil)
    seconds= "1"
end


#Initialize Objects
game = Game_of_life.new()
game.loadfile(filename);
view = Game_Of_Life_View.new(game);
cursor = Cursor_Wrap.new();

game.play_full_game(view, cursor,numruns,true,seconds.to_f());




