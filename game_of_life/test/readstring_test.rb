require_relative '../lib/game_of_life_lib.rb'

require 'minitest/autorun'

class TestGame_of_life_read_string < MiniTest::Test

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

    
  end
   
  def test_four_x_five_with_a_life_in_it
  
    fourxfour=<<EOF
*.*.
....
*.*.
....
*.*.
EOF
    
    #The only place with a life in it will be elements where x mod 2 and y mod 2 are 0
    #So we can write a for loop
     
    playing = Game_of_life.new()
    playing.loadstring(fourxfour);
    assert_equal(5, playing.grid.length,"grid is an array with five rows");
     
    playing.grid.each { | y |
      numrow = 0;
      assert_equal(4, y.length(),"Length of Y at " + numrow.to_s() + " should be four");
    }
     
    for ycoord in 0..4 do 
      for xcoord in 0..3 do 
        expect = "."
        if ycoord%2==0 and xcoord%2==0 then
          expect = "*"
        end
        assert_equal(expect,playing.grid[ycoord][xcoord],"Position at (" + xcoord.to_s() + "," + ycoord.to_s() + ") should be " + expect);
      end
    end
  end
end
