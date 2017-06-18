

class Game_of_life

  attr_accessor :grid;

  #--------------------------------------------------#
  # Core Methods                                     #
  #--------------------------------------------------#  
  

  def initialize()
    @grid = Array.new(){Array.new()};
  end

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


  def loadfile(filename)
    file = File.open(filename);
    contents = file.read;
    loadstring(contents);

    rescue Errno::ENOENT => ex
      raise "Something went wrong trying to read file " + filename + " from disk.";
  end


  def get_surrounding_elementsxy(x,y)
    results = [];

    temparray = [[x-1,y-1],[x,y-1],[x+1,y-1],[x-1,y],[x+1,y],[x-1,y+1],[x,y+1],[x+1,y+1]];

    temparray.each { |set| 
      if isvalidsquare(set[0],set[1]) then
        results.push(set[0].to_s()+","+set[1].to_s());
      end
    }
    
    return results;
  end

  #--------------------------------------------------#
  # Public methods to make things easier             #
  #--------------------------------------------------#

  def getatxy(x,y)
    if x<0 or y<0 or y>@grid.length()-1 or x>@grid[y].length()
      raise "("+x.to_s()+","+y.to_s()+") exceeds the size of grid.";
    else  
      return @grid[y][x];
    end
  end

  def getysize()
    check_grid_size();
    return grid.length();
  end

  def getxsize()
    check_grid_size();
    return grid[0].length();
  end



  #--------------------------------------------------#
  # Helper Methods                                   #
  #--------------------------------------------------#
  def isvalidsquare(x,y)
    if (x<0 or y<0) 
       return false;
    end

    if (x>=getxsize() or y>=getysize())
        return false;
    end

    return true;
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

  
end


