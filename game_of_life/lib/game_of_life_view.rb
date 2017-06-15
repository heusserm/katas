
class Game_Of_Life_View

      attr_accessor :game

      def initialize(newgame)
        @game = newgame;
      end

      def get_grid_as_string
        result = "";
          @game.grid.each { |row| 
            row.each { |char|
              result = result+char;
            }
            result = result + "\n";
          }
         
        result = result.chomp()
        
        return result;
      end

      def display
        result = get_grid_as_string
        print result;
      end
end
