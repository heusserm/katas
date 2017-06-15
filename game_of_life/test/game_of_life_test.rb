require_relative '../lib/game_of_life_lib.rb'

require 'minitest/autorun'

class TestGame_of_life < MiniTest::Test
  def test_init 
    playing = Game_of_life.new()
    assert(playing!=nil,"Created object")
    assert(playing.grid.kind_of?(Array),"Loadstring creates a array");
    assert(playing.grid.length==0,"And the array is empty");
  end

   def test_simple_read

  twoxtwoblank=<<EOF
..
..
EOF
     playing = Game_of_life.new()
     playing.loadstring(twoxtwoblank);
     assert(playing.grid.kind_of?(Array),"Loadstring creates a array"); 

   threexthreeoneinthemiddle=<<EOF
   ...
   .*.
   ...
EOF

  end
     

end
