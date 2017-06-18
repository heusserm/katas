#game_of_life.rb

require_relative 'lib/game_of_life_lib.rb'
require_relative 'lib/game_of_life_view.rb'

puts "\n\n-------------------------------------------------------";
puts "game_of_lie.rb (numrums) (filename)";
puts " ";
puts "numruns - Number of generations to run";
puts "filename - Path to file to load";
puts " ";
puts "Conway's Game Of Life Spike\nBy Matthew Heusser Matt@xndev.com\nToday this just reads in a day0 game of life from disk\n";
puts "-------------------------------------------------------\n\n"

game = Game_of_life.new()

numruns = ARGV[0]
filename = ARGV[1]

game.loadfile(filename);

view = Game_Of_Life_View.new(game);

for i in 0..(numruns.to_i()-1)
  view.display();
  puts "\n\n\n";
  game = game.nextgen();
  view = Game_Of_Life_View.new(game);
  sleep(1);
end


