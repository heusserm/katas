require_relative '../lib/game_of_life_lib.rb'
require_relative '../lib/game_of_life_view.rb'
require_relative 'sample_strings.rb'
require 'minitest/autorun'


class TestGame_of_life < MiniTest::Test
  def test_init 
    playing = Game_of_life.new()
    assert(playing!=nil,"Created object")
    assert(playing.grid.kind_of?(Array),"Loadstring creates a array");
    assert_equal(0,playing.grid.length,"And the array is empty");
  end

  def test_simple_game
    playing = Game_of_life.new()
    assert(playing!=nil,"Created object")
    playing.loadstring(Sample_Strings.threexthreemiddle());
    nextGen = playing.nextgen();
    view = Game_Of_Life_View.new(nextGen);
    assert(view.kind_of?(Game_Of_Life_View),"View is a game of life view");
    
    threexthreedaymiddledaytwo = Sample_Strings.threexthreemiddledaytwo();
    assert_equal(threexthreedaymiddledaytwo, view.get_grid_as_string(), "Loaded and printed string should be identical");
  end

  def rule_is_implemented(stringfrom,stringto)
    playing = Game_of_life.new()
    assert(playing!=nil,"Created object")
    playing.loadstring(stringfrom);
    nextGen = playing.nextgen();
    view = Game_Of_Life_View.new(nextGen);
    assert(view.kind_of?(Game_Of_Life_View),"View is a game of life view");
    
    assert_equal(stringto, view.get_grid_as_string(), "Loaded and printed string should be identical");
  end

  def test_rules
    rule_is_implemented(Sample_Strings.fivexfiveonesurvivor(), Sample_Strings.fivexfiveonesurvivorroundtwo());
    rule_is_implemented(Sample_Strings.fivexfiveonesurvivorthreearound(),  Sample_Strings.fivexfiveonesurvivorthreearoundroundtwo());
    rule_is_implemented(Sample_Strings.fivexfivetoomanyaround(), Sample_Strings.fivexfivetoomanyaroundroundtwo());
    rule_is_implemented(Sample_Strings.fivexfivespontaneousgeneration(), Sample_Strings.fivexfivespontaneousgenerationroundtwo());

  end


end
