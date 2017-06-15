

class Game_of_life

  attr_accessor :grid;
      
  def loadstring(gridasstring)
    #remove trailing newline
    gridasstring = gridasstring.chomp();
    array1 = gridasstring.split(/\n/);
    array1.each {|line|
      data_array2=line.split(//);
      @grid.push(data_array2);
    }
  end

  def loadfile(filemame)

  end

  def initialize()
    @grid = Array.new(){Array.new()};
  end
end


