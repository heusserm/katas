require_relative '../lib/game_of_life_lib.rb'

require 'minitest/autorun'

class TestGame_of_life < MiniTest::Test
  def test_init 
    playing = Game_of_life.new()
    assert(playing!=nil,"Created object")
  end

end