
require_relative '../lib/game_of_life_lib.rb'

require 'minitest/autorun'
require_relative 'sample_strings'

class TestGame_of_life < MiniTest::Test

  def test_full_game
    #Initialize Objects
    game = Game_of_life.new()
    game.loadstring(Sample_Strings.fivexfivespontaneousgeneration());
    view = Game_Of_Life_View_Mock.new(game);
    cursor = Cursor_Mock.new();
    game.play_full_game(view, cursor,6,false,0);
    assert_equal(5,cursor.moveup_called());
    assert_equal(6,view.display_called());
    assert_equal(5,view.newgame_assigned());
  end

end

class Cursor_Mock

      attr_accessor :moveup_called;
      attr_accessor :moveup_called_with;   

      def initialize()
        @moveup_called_with = [];
        @moveup_called = 0;
      end

      def moveup(numlines)
        @moveup_called = @moveup_called+1;
        @moveup_called_with.push(numlines);
      end
end

class Game_Of_Life_View_Mock
      attr_accessor :game
      attr_accessor :get_grid_as_string_called
      attr_accessor :display_called
      attr_accessor :game
      attr_accessor :newgame_assigned

      def assign_game(newgame)
        @newgame_assigned = @newgame_assigned+1
      end

      def initialize(newgame)
        @game = newgame;
        @get_grid_as_string_called = 0;
        @display_called = 0;
        @newgame_assigned = 0;
      end

      def get_grid_as_string
        @get_grid_as_string_called=@get_grid_as_string_called+1
        return "";
      end

      def display
        @display_called=@display_called+1
      end
end

