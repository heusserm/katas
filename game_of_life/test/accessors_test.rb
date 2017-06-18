require_relative '../lib/game_of_life_lib.rb'

require 'minitest/autorun'

class TestGame_of_life_read_string < MiniTest::Test


   def test_getxsize
     playing = Game_of_life.new()
     playing.loadstring(getsevenxfour());
     assert_equal(4, playing.getxsize());
   end

   def test_getysize
     playing = Game_of_life.new()
     playing.loadstring(getsevenxfour());
     assert_equal(7, playing.getysize());
   end

   def test_getxy_uninitialized_throws_exception
     playing = Game_of_life.new()
     assert_raises RuntimeError do
        playing.getxsize();
     end 

     assert_raises RuntimeError do
        playing.getysize();
     end    
   end


   def test_is_alive_true
     playing = Game_of_life.new()
     playing.loadstring(getsevenxfour());
     assert_equal(true, playing.is_alivexy(2,1));
   end

   def test_is_alive_false
     playing = Game_of_life.new()
     playing.loadstring(getsevenxfour());
     assert_equal(false, playing.is_alivexy(0,0));
   end



   def test_xy_getat_function

     sevenxfour = getsevenxfour();
     playing = Game_of_life.new()
     playing.loadstring(sevenxfour);
     #First Dimensional array is 2 
     assert_equal(".", playing.getatxy(0,0),"zerozero coord is dot");
     assert_equal("*", playing.getatxy(2,0),"two x, zero y is star");
     assert_equal("*", playing.getatxy(3,0),"three x, zero y is star");
     assert_equal(".", playing.getatxy(0,3),"zero x, three y is dot");
    
  end

  def test_setxy_throw_execeptions
    sevenxfour = getsevenxfour();
    playing = Game_of_life.new()
    assert_raises RuntimeError do
        playing.setatxy("*", -1,0);
    end

    assert_raises RuntimeError do
      playing.setatxy(".",10,1);
    end
       
    assert_raises RuntimeError do
      playing.setatxy(".",1,10);
    end

    assert_raises RuntimeError do
      playing.setatxy(".",1,-1);
    end

    assert_raises RuntimeError do
      playing.setatxy("h",1,2);
    end
  end
  

  def test_set_setatxy
     sevenxfour = getsevenxfour();
     playing = Game_of_life.new()
     playing.loadstring(sevenxfour);
     playing.setatxy("*", 0,0);
     playing.setatxy(".", 2,0);
     playing.setatxy(".", 3,0);
     playing.setatxy("*", 0,3);
     assert_equal("*", playing.getatxy(0,0),"zerozero coord is NOW a star");
     assert_equal(".", playing.getatxy(2,0),"two x, zero y is NOW a dot");
     assert_equal(".", playing.getatxy(3,0),"three x, zero y NOW a dot");
     assert_equal("*", playing.getatxy(0,3),"zero x, three y is NOW a star");
  end


   def test_toobig

   threexthree=<<EOF
...
...
..*
EOF

    playing = Game_of_life.new()
    playing.loadstring(threexthree);
    assert_raises RuntimeError do
      playing.getatxy(5,10);
    end

    assert_raises RuntimeError do
      playing.getatxy(0,10);
    end

    assert_raises RuntimeError do
      playing.getatxy(10,1);
    end

    assert_raises RuntimeError do
      playing.getatxy(-1,2);
    end

    assert_raises RuntimeError do
      playing.getatxy(2,-1);
    end

    val = playing.getatxy(2,2)
    assert_equal("*",val,"Yet the upper bound of the grid is fine");
  end

   def getsevenxfour()
   
  sevenxfour=<<EOF
..**
..*.
..*.
..*.
..*.
..*.
....
EOF
   return sevenxfour;
   end
end

