require_relative '../lib/game_of_life_lib.rb'

require 'minitest/autorun'

class TestGame_of_life < MiniTest::Test
  def test_5x5_loader 
    playing = Game_of_life.new()
    assert(playing!=nil,"Created object")
    assert(playing.grid.kind_of?(Array),"Loadstring creates a array");
    playing.loadfile("../sample_starting_files/5x5.txt");
    assert_equal(5,playing.grid.length,"Loaded a 5x5 grid");
    assert_equal("*", playing.grid[2][2],"middle char is a star");
    assert_equal("*", playing.grid[4][4],"far char is a star");
    assert_equal(".", playing.grid[4][0],"bottom left is a dot");
    assert_equal(".", playing.grid[0][4],"top right is a dot");
    assert_equal(".", playing.grid[2][1],"3rd row, 2nd position is a dot");
  end

  def test_file_does_not_exist_throws_error
    playing =  Game_of_life.new();
    assert_raises RuntimeError do
      playing.loadfile("thereshouldbenotextfilewiththisname.txt");
    end
  end

end
