#--------------------------------------------------------------------#
#An array-based implmentation of the bowling game kata               #
# By Matthew Heusser - Matt@xndev.com                                #
#                                                                    #
# The Rules of the Kata:                                             #
#   http://butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata      #
#                                                                    #
# An online score sheet for comparison:                              #
#   http://www.bowlinggenius.com/                                    #
#                                                                    #
# How to use the object:                                             #
#                                                                    #
# playing = Game.new();                                              #
# playing.roll(1);                                                   #
# playing.roll(1);                                                   #
# ... seventeen more rolls go by, now the final one                  #
# playing.roll(1);                                                   #
# score = playing.result();                                          #
# puts "Score is " + score.to_s();                                   #
#                                                                    #
# Strikes are recored as .roll(10)                                   #
#                                                                    #
# NOTE:                                                              #
#                                                                    #
# .roll returns a boolean true/false.                                #
# .roll(-1), .roll(1.5), .roll(11) all return false.                 #
# .roll() is recorded as zer                                         #
# A strike ends the frame. So 10 strikes in a row is ten 10's.       #
#                                                                    #
# If you /end/ on a strike, roll two more. If you end on a spare,    #
# roll one more. So a perfect game is twelve 10's.                   #
#                                                                    #
#--------------------------------------------------------------------#



class Game
  #frames is an array of arrays.
  attr :rolls;
  attr :frames; #pointers to start of frames
  attr :rollnum; #0 at start of frame; 2 after 2nd roll
                #then reset to zero, then increment frame


  def isgoodroll(pin)
    if pin.class!=Fixnum
      return false
    elsif
      pin>10 || pin<0
      return false
    else
      return true
    end
  end  
 
  def roll(pin)
    if (pin==nil)
      pin = 0
    end
 
    if !isgoodroll(pin)
      return false
    end
   
    @rolls.push(pin)
    @rollnum+=1
  
    if ( (pin==10 || rollnum==2)  && frames.length<10)
      @frames.push(@rolls.length()) #Zero-based arrays. 
                                 #So if you roll a 10, 1 is the start
                                 #Of the 2nd frame.
      @rollnum = 0
    end
   return true;
  end

  def initialize()
    @rolls = Array.new();
    @frames = Array.new();
    @frames.push(0);
    @rollnum = 0
  end
 

  def isStrike(frameArray)
    if frameArray!=nil && frameArray.class == Array 
      if frameArray.length()==1 
          if frameArray[0].class == Fixnum
            if frameArray[0]==10
               return true
	    end
	  end
       end
     end
     return false
  end

  def isSpare(frameArray)
    if !isStrike(frameArray) &&  frameArray.class == Array
      if frameArray.length()==2 
        if frameArray[0].class == Fixnum 
          if frameArray[1].class == Fixnum 
	    if  frameArray[0]+frameArray[1]==10
              return true
	    end
          end
        end 
      end
    end
    return false
  end



  def spareBonus(i)
    total = 0
    if @rolls[i+1]!=nil
      total+=rolls[i+1]
    end
    return total
  end 
 
  def strikeBonus(i)
    total = spareBonus(i)
    if @rolls[i+2]!=nil
      total+=rolls[i+2]
    end
    
    return total

  end

  

  def framescore(start, framenum)

    frametotal = 0
    framemax = @rolls.length-1
 
    frameArray = Array.new();

    if @frames[framenum+1]!=nil
      framemax =  @frames[framenum+1]-1
    end

    for i in start..framemax
      frametotal=frametotal+@rolls[i]
      frameArray.push(@rolls[i])
    end
    
    
    if isStrike(frameArray)
      frametotal+=strikeBonus(i)
    elsif isSpare(frameArray)
      frametotal+=spareBonus(i)
    end
     return frametotal
  end

  def result
    total = 0
    previousframeindex =0
    @frames.each_with_index { |val, index | 
      frameval = framescore(val, index)
      total+=frameval
    }
    return total
  end

end


