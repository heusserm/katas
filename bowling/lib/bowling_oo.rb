
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
end



class Game
  #frames is an array of arrays.
  attr :frames;

  def roll(pin1, pin2)
    frame = Frame.new(pin1, pin2)
    frames.push(frame);
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
    frames.each do |frame|
      total+=frame.pin1 + frame.pin2
    end
    return total
  end

end


