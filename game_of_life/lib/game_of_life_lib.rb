

class Game_of_life

  attr_accessor :grid;
      
  def loadstring(gridasstring)
    #remove trailing newline
    gridasstring = gridasstring.chomp();

    #throw exception is anything but '\n','.' or '*'
    if gridasstring =~ /[^\n\.\*]/
      raise "Grid must contain only * . and newline to start. sorry."
    end

    array1 = gridasstring.split(/\n/);
    array1.each {|line|
      data_array2=line.split(//);
      @grid.push(data_array2);
    }
    check_grid_size();
  end


  def check_grid_size
    if grid.length()<1 
      raise "Grid must have at least one line";
    end

    standardsize = grid[0].length();
    if standardsize<1
      raise "Each row must have a least one character";
    end

    grid.each {|y|
      if y.length()!=standardsize 
        raise "Each row must match a length of " + standardsize.to_s();
      end
    } 

  end

  def loadfile(filename)
    file = File.open(filename);
    contents = file.read;
    loadstring(contents);

    rescue Errno::ENOENT => ex
      raise "Something went wrong trying to read file " + filename + " from disk.";
  end

  def initialize()
    @grid = Array.new(){Array.new()};
  end

  def getatxy(x,y)
    if x<0 or y<0 or y>@grid.length()-1 or x>@grid[y].length()
      raise "("+x.to_s()+","+y.to_s()+") exceeds the size of grid.";
    else  
      return @grid[y][x];
    end
  end
  
end


