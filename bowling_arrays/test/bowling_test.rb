require_relative '../lib/bowling_arrays.rb'
require 'minitest/autorun'

def roll_many(game, numrolls, num)
  for i in 1..numrolls
    game.roll(num)
  end
end


class TestBowling < MiniTest::Test

  def test_rolling_ones
    playing = Game.new();
    roll_many(playing, 20, 1);
    score = playing.result()
    assert_equal(20, score)
  end

  def test_spare
    playing = Game.new();
    #Score = 5+5+(A bonus of 4) + 4+4 + 5+4
    #Score = 10+4 + 8 + 9
    #Score = 14 + 17
    #Score = 31
    playing.roll(5);
    playing.roll(5);
    playing.roll(4);
    playing.roll(4);
    playing.roll(5);
    playing.roll(4);
    score = playing.result();
    assert_equal(31, score);
  end


  def test_real_spare_game
    playing = Game.new();
    roll_many(playing, 21, 5);
    score = playing.result();
    assert_equal(150, score);
   end

    def test_strike
    playing = Game.new();
    #score = 10+5+4 + 5+4 + 10+4+5 + 4+5
    #score = 19 + 9 + 19 + 9
    #score = 27 + 27
    #score = 54
    playing.roll(10);
    playing.roll(5);
    playing.roll(4);
    playing.roll(10);
    playing.roll(4);
    playing.roll(5);
    score = playing.result()
    assert_equal(56, score)
  end


  def test_strikeFull
    playing = Game.new();
    roll_many(playing,12,10);
    score = playing.result()
    assert_equal(300, score)
  end

  def test_mix_of_strikes_and_spares
    playing = Game.new();
    playing.roll(10);
    playing.roll(5);
    playing.roll(5);
    playing.roll(7);
    playing.roll(0);
    playing.roll(6)
    playing.roll(4);
    playing.roll(10);
    playing.roll(5);
    playing.roll(5);
    playing.roll(4);
    playing.roll(4);
    playing.roll(10);
    playing.roll(8);
    playing.roll(2);
    playing.roll(10);
    playing.roll(5);
    playing.roll(5);
    score = playing.result();
    assert_equal(166, score);
  end




end




