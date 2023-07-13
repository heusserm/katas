require_relative '../lib/bowling_oo.rb'
require 'minitest/autorun'


def roll_many(game, numrolls, num1, num2)
  for i in 1..numrolls
    game.roll(num1, num2)
  end
end

class TestBowling < MiniTest::Test

  def test_rolling_ones
    playing = Game.new();
    roll_many(playing, 10, 1, 1);
    score = playing.result()
    assert_equal(20, score)
  end

  def test_rolling_twos
    playing = Game.new();
    roll_many(playing, 10, 2, 2);
    score = playing.result()
    assert_equal(40, score)
  end



  def test_spare
    playing = Game.new();
    #Score = 5+5+(A bonus of 4) + 4+4 + 5+4
    #Score = 10+4 + 8 + 9
    #Score = 14 + 17
    #Score = 31
    playing.roll(5,5);
    playing.roll(4,4);
    playing.roll(5,4);
    score = playing.result();
    assert_equal(31, score);
  end


  def test_real_spare_game
    playing = Game.new();
    roll_many(playing, 10, 5, 5);
    playing.rollBonusForSpare(5);
    score = playing.result();
    assert_equal(150, score);
  end

  def test_strike
    playing = Game.new();
    #score = 10+5+4 + 5+4 + 10+4+5 + 4+5
    #score = 19 + 9 + 19 + 9
    #score = 28 + 28
    #score = 56
    playing.roll(10,0);
    playing.roll(5,4);
    playing.roll(10,0);
    playing.roll(4,5);
    score = playing.result()
    assert_equal(56, score)
  end


  def test_strikeFull
    playing = Game.new();
    roll_many(playing,10,10,0);
    playing.rollBonusForStrike(10,10)
    score = playing.result()
    assert_equal(300, score)
  end

  def test_mix_of_strikes_and_spares
    playing = Game.new();
    playing.roll(10,0);
    playing.roll(5,5);
    playing.roll(7,0);
    playing.roll(6,4);
    playing.roll(10,0);
    playing.roll(5,5);
    playing.roll(4,4);
    playing.roll(10,0);
    playing.roll(8,2);
    playing.roll(10,0);
    playing.rollBonusForStrike(5,5);
    score = playing.result();
    assert_equal(166, score);
  end

end

