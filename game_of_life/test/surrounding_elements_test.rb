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
  end

end

