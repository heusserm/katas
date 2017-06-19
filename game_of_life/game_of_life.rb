#game_of_life.rb

require_relative 'lib/game_of_life_lib.rb'
require_relative 'lib/game_of_life_view.rb'
require_relative 'lib/cursor_wrap.rb'

puts "\n\n-------------------------------------------------------";
puts "game_of_life.rb (numrums) (filename)";
puts " ";
puts "numruns - Number of generations to run";
puts "filename - Path to file to load";
puts " ";
puts "Conway's Game Of Life ASCII\nBy Matthew Heusser Matt@xndev.com\nToday this just reads in a day0 game of life from disk\n";
puts "-------------------------------------------------------\n\n"


numruns = ARGV[0]
filename = ARGV[1]

#Initialize Objects
game = Game_of_life.new()
game.loadfile(filename);
view = Game_Of_Life_View.new(game);
cursor = Cursor_Wrap.new();

#Would you like to play a game?
for i in 0..(numruns.to_i()-1)
  puts " Round: " + (i+1).to_s() + "\n\n";
  view.display();
  puts "\n\n\n";
  if (i<numruns.to_i()-1)
    game = game.nextgen();
    view = Game_Of_Life_View.new(game);
    sleep(1);
    cursor.moveup(game.getysize()+4);
  end
end




