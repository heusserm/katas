#game_of_life.rb

require_relative 'lib/game_of_life_lib.rb'
require_relative 'lib/game_of_life_view.rb'

puts "\n\n-------------------------------------------------------";
puts "Conway's Game Of Life Spike\nBy Matthew Heusser Matt@xndev.com\nToday this just reads in a day0 game of life from disk\n";
puts "-------------------------------------------------------\n\n"

game = Game_of_life.new()
game.loadfile('./sample_starting_files/5x5.txt');

view = Game_Of_Life_View.new(game);
view.display();

puts "\n\n\n";
