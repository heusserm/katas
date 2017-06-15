
class Cursor_Wrap

      @escape = "\e[";

      def initialize()

      end

      def moveup(numlines)
        escape = "\e[";
        $stdout.write "#{escape}#{numlines}A";
       
      end

end
