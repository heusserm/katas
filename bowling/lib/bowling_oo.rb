

#--------------------------------------------------------------------#
#An Object-oriented implmentation of the bowling game kata           #
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
# playing.roll(1,1);                                                 #
# playing.roll(1,1);                                                 #
# ... seven more rolls go by, now the final one:                     #
# playing.roll(1,1);                                                 #
# score = playing.result();                                          #
# puts "Score is " + score.to_s();                                   #
#                                                                    #
# Strikes are recored as .roll(10,0)                                 #
#                                                                    #
# If you get a spare on the final roll then to .rollForSpare(5)      #
# where 5 is the score, or .rollForStrike(5,5)                       #
#                                                                    #
# If your last two rolls are strikes, it would be:                   #
#   .rollForStrike(10,10)                                            # 
#--------------------------------------------------------------------#
#
class Frame
   attr_accessor :pin1
   attr_accessor :pin2

   def initialize(pin1, pin2)
     @pin1 = pin1;
     @pin2 = pin2;
   end

   def isStrike()
     if @pin1==10 then
       return true
     else
       return false
     end
   end


   def isSpare()
     if !isStrike() && pin1+pin2==10 then
       return true
     else
       return false
     end
   end


   def isValid()
     if (pin1<0 || pin2<0) then
       return false
     end

     if (pin1+pin2>10) then
       return false
     end

     return true
   end


   def getScore(nextFrame, frameAfterThat)
     if (!isValid) 
       return 0
     end

     score = pin1+pin2
     if isSpare() && nextFrame!=nil
       score+=nextFrame.pin1
     end

     return score
   end

end


class BonusFrame < Frame
  #Bonus Frames do not count their roll toward total score
  #only as a bonus
  def isValid()
    return false
  end
end


class Game
  #frames is an array of arrays.
  attr :frames;

  def roll(pin1, pin2)
    frame = Frame.new(pin1, pin2)
    frames.push(frame);
  end

  def rollBonusForSpare(pin1)
    frame = BonusFrame.new(pin1, 0)
    frames.push(frame)
  end

  def rollBonusForStrike(pin1, pin2)
    frame = BonusFrame.new(pin1, pin2)
    frames.push(frame)
  end 

  def initialize()
    @frames = Array.new();
  end

  def result
    score = calcscore()
    return score
  end

  def calcscore
    total = 0
    for i in 0..frames.length-1
      total+=frames[i].getScore(frames[i+1], frames[i+2])
    end
    return total
  end

end


