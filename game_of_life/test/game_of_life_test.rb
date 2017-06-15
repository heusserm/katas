require_relative '../lib/game_of_life_lib.rb'

require 'minitest/autorun'

class TestGame_of_life < MiniTest::Test
  def test_init 
    playing = Game_of_life.new()
    assert(playing!=nil,"Created object")
    assert(playing.grid.kind_of?(Array),"Loadstring creates a array");
    assert_equal(0,playing.grid.length,"And the array is empty");
  end

   def test_simple_read

  twoxtwoblank=<<EOF
..
..
EOF
     playing = Game_of_life.new()
     playing.loadstring(twoxtwoblank);
     #First Dimensional array is 2 
     assert_equal(2, playing.grid.length,"grid is an array with two elements");
     
     #each sub-dimensional array is 2
     playing.grid.each { | y |
         numrow = 0;
         assert_equal(2, y.length(),"Length of Y at " + numrow.to_s() + " is two");
         assert_equal(".",y[0],"First element is a dot");
         assert_equal(".",y[1],"second element is a dot");
         numrow=numrow+1;
     }
   threexthreeoneinthemiddle=<<EOF
   ...
   .*.
   ...
EOF

  end
     

end
