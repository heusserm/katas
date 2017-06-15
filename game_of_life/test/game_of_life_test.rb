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
     assert(playing.grid.length()==2,"grid is an array with two elements");
     playing.grid.each { | y |
        y.each { | x | 
          numX=numX+1;
        }
       }
     playing.grid.each { | y |
         numrow = 0;
         assert(y.length()==2,"Length of Y at " + numrow.to_s() + " is two");
         numrow=numrow+1;
     }
   threexthreeoneinthemiddle=<<EOF
   ...
   .*.
   ...
EOF

  end
     

end
