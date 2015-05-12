require_relative '../lib/bowling_oo.rb'
require 'minitest/autorun'

class TestBowling < MiniTest::Test

  def test_rolling_ones
    playing = Game.new();
    playing.roll(1,1);
    playing.roll(1,1);
    playing.roll(1,1);
    playing.roll(1,1);
    playing.roll(1,1);
    playing.roll(1,1);
    playing.roll(1,1);
    playing.roll(1,1);
    playing.roll(1,1);   
    playing.roll(1,1);
    score = playing.result()
    assert_equal(20, score)
  end
end

