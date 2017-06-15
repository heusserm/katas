

class Game_of_life

  attr_accessor :grid;
      
  def loadstring(gridasstring)
    array1 = gridasstring.split(/\n/);
    indexA = 0;
    indexB = 0;
    array1.each {|line|
      indexB = 0; 
      array2=line.split(//);
        array2.each {|char|
          @grid.push([indexB,char]);
        }
      indexA = indexA+1;
    }
  end

  def loadfile(filemame)

  end

  def initialize()
    @grid = Array.new(){Array.new()};
  end
end


