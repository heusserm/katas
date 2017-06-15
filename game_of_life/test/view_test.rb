
require_relative '../lib/game_of_life_lib.rb'
require_relative '../lib/game_of_life_view.rb'

require 'minitest/autorun'

class TestGame_of_life_view < MiniTest::Test

       def test_create_view
         playing = Game_of_life.new();
         view = Game_Of_Life_View.new(playing);
         assert(view.kind_of?(Game_Of_Life_View),"View is a game of life view");         
         assert(view.game!=nil,"Game is passed into constructor");
         assert(view.game.kind_of?(Game_of_life),"...and it is a game");
       end

end


