require_relative '../lib/game_of_life_lib.rb'

require 'minitest/autorun'

class TestGame_of_life < MiniTest::Test
  def test_init 
    playing = Game_of_life.new()
    assert(playing!=nil,"Created object")
    assert(playing.grid.kind_of?(Array),"Loadstring creates a array");
    assert_equal(0,playing.grid.length,"And the array is empty");
  end
end
