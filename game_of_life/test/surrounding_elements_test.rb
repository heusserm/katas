require_relative '../lib/game_of_life_lib.rb'
require_relative 'sample_strings.rb'

require 'minitest/autorun'

class TestGame_of_life_surrounding_elements < MiniTest::Test

  def test_middle_of_three_x_three
      playing = Game_of_life.new()
      assert(playing!=nil,"Created object")
      playing.loadstring(Sample_Strings.threexthreemiddle()); 

      results = playing.get_surrounding_elementsxy(1,1);
      assert(results.kind_of?(Array), "results are an array");
      assert_equal(results.length(),8,"There are eight surrounding squares around 1,1 zero index");
      assert_equal("0,0",results[0],"First surround square is zero zero");
      assert_equal("1,0",results[1],"Second surrounding square is one zero");
      assert_equal("2,0",results[2],"Third surrounding square is 2,0");
      assert_equal("0,1",results[3],"Fourth surrounding square is 1,0");
      assert_equal("2,1",results[4],"Fifth surrounding square is 2,1");
      assert_equal("0,2",results[5],"Sixth surrounding square is 0,2");
      assert_equal("1,2",results[6],"Seventh surrounding square is 1,2");
      assert_equal("2,2",results[7],"Eigth surrounding square is 2,2");
  end


end

