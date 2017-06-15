
require_relative '../lib/game_of_life_lib.rb'
require_relative '../lib/game_of_life_view.rb'

require 'minitest/autorun'

class TestGame_of_life_view < MiniTest::Test

       def test_create_view
         playing = Game_of_life.new();
         view = Game_Of_Life_View.new(playing);
         assert(view.kind_of?(Game_Of_Life_View),"Loadstring creates a array");
         
         assert(view.game!=nil,"Game created on constructor");
       end

end


