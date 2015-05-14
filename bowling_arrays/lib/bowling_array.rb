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
# A strike ends the frame. So 10 strikes in a row is ten 10's.       #
#                                                                    #
# If you /end/ on a strike, roll two more. If you end on a spare,    #
# roll one more. So a perfect game is twelve 10's.                   #
#                                                                    #
# If you get a spare on the final roll then to .rollForSpare(5)      #
# where 5 is the score, or .rollForStrike(5,5)                       #
#                                                                    #
# If your last two rolls are strikes, it would be:                   #
#   .rollForStrike(10,10)                                            #
#--------------------------------------------------------------------#
#


class Game
  #frames is an array of arrays.
  attr :rolls;

  def roll(pin)
    rolls.push(pin);
  end

  def initialize()
    @rolls = Array.new();
  end
 
  def result
    return 0;
  end

end


